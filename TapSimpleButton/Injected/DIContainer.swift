//
//  DI.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/05.
//

import Foundation
import Combine
import SwiftUI

struct DIContainer {
    let services: Services = .init( transaction: TransactionService())
}

private var cancellables = Set<AnyCancellable>()

struct TransactionService {
    
    func fetchTransactions() -> AnyPublisher<TransactionsAPI.Response, Error> {
        TransactionsAPI.fetch()
    }
    
    func regist() -> AnyPublisher<TransactionsAPI.RegistResponse, Error> {
        return TransactionsAPI.regist()
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

