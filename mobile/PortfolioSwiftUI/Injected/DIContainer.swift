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
    let services: Services = .init(transaction: TransactionService())
}

private var cancellables = Set<AnyCancellable>()

struct TransactionService {
    public func fetch() -> AnyPublisher<TransactionsAPI.Response, Error> {
        TransactionsAPI.fetch()
    }
    public func regist() -> AnyPublisher<TransactionsAPI.RegistResponse, Error> {
        return TransactionsAPI.regist()
    }
    public func delete(transaction: Transaction)  -> AnyPublisher<TransactionsAPI.RegistResponse, Error> {
        return TransactionsAPI.delete(transaction: transaction)
    }
    public func update(_ transaction: Transaction) -> AnyPublisher<TransactionsAPI.UpdateResponse, Error> {
        return TransactionsAPI.update()
    }
    public func search() -> AnyPublisher<TransactionsAPI.Response, Error> {
        return TransactionsAPI.search()
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
