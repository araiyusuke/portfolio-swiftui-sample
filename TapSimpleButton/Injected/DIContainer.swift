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
    
//    func fetchTransactions(transactions: Binding<Loadable<[Transaction]>>) {

        
    func fetchTransactions() -> AnyPublisher<TransactionsAPI.Response, Error> {
        TransactionsAPI.fetch()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                print(completion)
//            }, receiveValue: { response in
//                transactions.wrappedValue = .loaded(response.transactions)
////                transactions.wrappedValue.value =
////                transactions.wrappedValue = .loaded(response.transactions)
////                    self.transactions = response.transactions
//            })
//            .store(in: &cancellables)
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

