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
}
