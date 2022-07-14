//
//  TransactionsAPI.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine

enum TransactionsAPI {

    private static let agent = AgentFactory.create()

    struct Response: Mockable {
        let transactions: [Transaction]
        static func mock(_ file: String? = nil) -> Response {
            let decoder = jsonDecoder()
            return try! decoder.decode(Response.self, from: loadFile(json: file ?? "Success_Fetch_Transactions"))
        }
    }

    struct Success: Codable {
        let success: Bool
    }

    struct RegistResponse: Mockable {

        let transactions: Success

        static func mock(_ file: String? = nil) -> RegistResponse {
            let decoder = jsonDecoder()
            // swiftlint:disable:next force_cast
            return try! decoder.decode(RegistResponse.self, from: loadFile(json: file ?? "Success_Regist_Transaction"))
        }
    }

    struct UpdateResponse: Mockable {

        let transactions: Success

        static func mock(_ file: String? = nil) -> UpdateResponse {
            let decoder = jsonDecoder()
            return try! decoder.decode(UpdateResponse.self, from: loadFile(json: file ?? "Success_Regist_Transaction"))
        }
    }

    static func fetch() -> AnyPublisher<Response, Error> {
        return agent.run(
                TransactionsApi
                    .Fetch
                    .request()
        )
    }
    static func regist() -> AnyPublisher<RegistResponse, Error> {
        return agent.run(
            TransactionsApi
                .Regist
                .request()
        )
    }

    // 取引編集後の上書きボタンをタップした時に実行
    static func update() -> AnyPublisher<UpdateResponse, Error> {
        return agent.run(
            TransactionsApi
                .Update
                .request()
        )
    }
}
