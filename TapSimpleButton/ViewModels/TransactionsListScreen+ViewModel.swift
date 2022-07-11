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
        @Published var transactionsList: [Transaction] = []
        @Published var isShowSecond: Bool = false

        
        init(container: DIContainer, transactions: Loadable<[Transaction]> = .notRequested) {
            self.container = container
            self._transactions = .init(initialValue: transactions)
        }
        
        /// 取引数を取得
        public var searchCount: Int {
            return transactions.value?.count ?? 0
        }
        
        /// 取引一覧を取得
        public func fetchTransactions() {
                    
            transactions = .isLoading

            container
                .services
                .transaction
                .fetch()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    print(completion)
                }, receiveValue: { response in
                    self.transactionsList = response.transactions
                    self.transactions = .loaded(response.transactions)
                })
                .store(in: &cancellables)
        }
        
        
    }
}
