//
//  DI.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/05.
//

import Foundation
import Combine

struct DIContainer {
    let services: Services = .init( transaction: TransactionService())
}

struct TransactionService {
    
    func fetchTransactions() -> AnyPublisher<TransactionsAPI.Response, Error> {
        TransactionsAPI.fetch()
    }
}

extension DIContainer {
    struct Services {
        
        let transaction: TransactionService

        init(transaction: TransactionService) {
            self.transaction = transaction
        }
    }
}

