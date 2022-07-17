//
//  AgentFactory.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine

struct APIMockAgent: APIAgentProtocol {
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
        return Just(
            T.mock(mockFile)
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}

struct AgentFactory {
    static func create(config: URLSessionConfiguration? = nil) -> APIAgentProtocol {
        #if NotServer
        return APIAgent(config: config)
        #else
        return APIMockAgent()
        #endif
    }
    static func stub(statusCd: Int, json: String) -> URLSessionConfiguration {
        StubURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!, statusCode: statusCd, httpVersion: "HTTP/2", headerFields: [:])!
            let data = loadFile(json: json)
            return (response, data)
        }

        let config = URLSessionConfiguration.default
        config.protocolClasses = [StubURLProtocol.self]
        return config
    }
}

func loadFile(json: String) -> Data {
    let path = Bundle.main.path(forResource: json, ofType: "json")!
    let url = URL(fileURLWithPath: path)
    return try! Data(contentsOf: url)
}
