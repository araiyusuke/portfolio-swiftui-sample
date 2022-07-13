//
//  APIAgent.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine

typealias RequestHandler = ((URLRequest) throws -> (HTTPURLResponse, Data?))

struct APIAgent: APIAgentProtocol {
    
    let config: URLSessionConfiguration?
    
    init(config: URLSessionConfiguration? = nil ) {
        self.config = config
    }
    
    var session: URLSession {
        if let config = config {
            return URLSession.init(configuration: config)
        } else {
            return URLSession.shared
        }
    }
    
    func run<T: Mockable>(_ request: URLRequest, mockFile: String?, statusCd: Int?) -> AnyPublisher<T, Error> {
        return API.run(session.dataTaskPublisher(for: request), mockFile: mockFile, statusCd: statusCd)
    }
}

class StubURLProtocol: URLProtocol {
    
    static var requestHandler: RequestHandler?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        guard let handler = Self.requestHandler else {
            fatalError("Handler is unavailable")
        }
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        } catch let e {
            client?.urlProtocol(self, didFailWithError: e)
        }
    }
    override func stopLoading() {}
}

extension API {
    
    static func run<T: Mockable>(_ dataTaskPublisher: URLSession.DataTaskPublisher, mockFile: String?, statusCd: Int?) -> AnyPublisher<T, Error> {
        
        dataTaskPublisher
            .tryMap { dataTaskOutput -> Result<URLSession.DataTaskPublisher.Output, Error> in
                guard let httpResponse = dataTaskOutput.response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                print(httpResponse)

                // ステータスコードを取得
                let statusCode = httpResponse.statusCode
                                                
                // 500番台エラー
                if StatusCode.HTTP_SERVER_ERROR_RANGE.contains(statusCode) {
                    throw APIError.serverError
                }

                // 400番台エラー
                if StatusCode.HTTP_CLIENT_ERROR_RANGE.contains(statusCode) {
                                        
                    // トークンエラー
                    if statusCode == StatusCode.HTTP_UNAUTHORIZED_401 {
                        let decoder = jsonDecoder()
                        let data = try decoder.decode(ResponseResultError.self, from: dataTaskOutput.data)
                        if data.message == "Error:DeviceTokenが正しくありません" {
                            throw APIError.unauthorized(.device)
                        } else {
                            throw APIError.unauthorized(.member)
                        }
                    }

                    // 入力エラー
                    if statusCode == StatusCode.HTTP_UNPROCESSABLE_ENTITY_422 {
                        let decoder = jsonDecoder()
                        let data = try decoder.decode(ResponseResultError.self, from: dataTaskOutput.data)
                        throw APIError.validation(data: data)
                    }
                    
                    if statusCode == StatusCode.HTTP_TOO_MANY_REQUESTS_429 {
                        throw APIError.tooManyRequest
                    }
                    
                    if StatusCode.HTTP_NOT_FOUND_AND_NOT_ALLOWED.contains(statusCode) {
                        throw APIError.serverError
                    }
                
                }
                
                return .success(dataTaskOutput)
            }

            .catch { error -> AnyPublisher<Result<URLSession.DataTaskPublisher.Output, Error>, Error> in
                switch error {
                // 一部エラーについてはretryさせる。
                case URLError.notConnectedToInternet:
                    // 3秒後にretry
    //                    return Fail(error: error)
    //                        .delay(for: 3, scheduler: DispatchQueue.main)
    //                        .eraseToAnyPublisher()
                    
                    return Just(.failure(APIError.wifiError))
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
            
                // retryさせいないエラー(sinkの.failureに到達する)
                case URLError.timedOut:
                    return Just(.failure(error))
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()

                case APIError.unauthorized:
                    return Just(.failure(error))
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                    
                case APIError.serverError:
                    return Just(.failure(error))
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                    
                case APIError.tooManyRequest:
                    return Just(.failure(error))
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                    
                // 入力フォームの検証
                case APIError.validation(let data):
                    do {
                        return Just(.failure(APIError.validation(data: data)))
                            .setFailureType(to: Error.self)
                            .eraseToAnyPublisher()
                    }

                default:
                    // 401などのエラーはここにくる。
                    return Just(.failure(error))
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                }
            }
            .retry(2)
            // 無事成功してJSONが取得できた
            .tryMap { result -> T in
                switch result {
                case .success:
                    do {
                        let decoder = jsonDecoder()
                        return try decoder.decode(T.self, from: result.get().data)
                    } catch {
                        print(error)
                        throw APIError.jsonDecodeError
                    }
                case .failure(let error):
                    throw error
                }
            }
            .eraseToAnyPublisher()
    }
}
