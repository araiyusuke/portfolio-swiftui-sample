//
//  UsersAPI.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/22.
//

import Foundation
import Combine

enum UsersApi {

    private static let agent = AgentFactory.create()

    struct FetchToken: RequestParameter {
        static let endPoint = EndPoint(url: "\(Api.userEndPoint)/")
        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .post)
        }
    }

    struct Token: Mockable, Hashable {
        var token: String
    }

    struct TokenResponse: Mockable {
        let user: Token
        static func mock(_ file: String? = nil) -> TokenResponse {
            let decoder = jsonDecoder()
            return try! decoder.decode(TokenResponse.self, from: loadFile(json: file ?? "Success_Login"))
        }
    }

    static func fetchToken() -> AnyPublisher<UsersApi.TokenResponse, Error> {
        return agent.run(
            UsersApi
                .FetchToken
                .request()
        )
    }
}
