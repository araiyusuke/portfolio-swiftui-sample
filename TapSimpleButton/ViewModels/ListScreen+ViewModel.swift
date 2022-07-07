//
//  ListScreen+ViewModel.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/05.
//

import Foundation
import SwiftUI
import Combine

extension TransactionsListScreen {
    
    class ViewModel: ObservableObject {
        
        let container: DIContainer
        private var cancellables = Set<AnyCancellable>()

        @Published var transactions: Loadable<[Transaction]>

        init(container: DIContainer, transactions: Loadable<[Transaction]> = .notRequested) {
            self.container = container
            self._transactions = .init(initialValue: transactions)
        }
        
        var count: Int {
            return transactions.value?.count ?? 0
        }
        
        func fetchTransactions() {
                    
            transactions = .isLoading

            container.services.transaction.fetchTransactions()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    print(completion)
                }, receiveValue: { response in
                    self.transactions = .loaded(response.transactions)
                })
                .store(in: &cancellables)
        }
    }
}
