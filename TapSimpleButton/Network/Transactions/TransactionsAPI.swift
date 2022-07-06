//
//  TransactionsAPI.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine

enum TransactionsAPI {
    
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
            return try! decoder.decode(RegistResponse.self, from: loadFile(json: file ?? "Success_Regist_Transaction"))
        }
    }
    
    private static let agent = AgentFactory.create()

    static func fetch() -> AnyPublisher<Response, Error> {
        return agent.run(
            API
                .Transactions
                .Fetch
                .request()
        )
    }
    
    static func regist() -> AnyPublisher<RegistResponse, Error> {
        return agent.run(
            API
                .Transactions
                .Regist
                .request()
        )
    }
}
