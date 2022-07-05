//
//  ListScreen+ViewModel.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/05.
//

import Foundation
import SwiftUI
import Combine

extension ListScreen {
    
    class ViewModel: ObservableObject {
        
        let container: DIContainer
        private var cancellables = Set<AnyCancellable>()

        @Published var transactions: [Transaction] = []

        init(container: DIContainer) {
            self.container = container
        }
        
        func fetch() {
            container.services.transaction.fetchTransactions()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    print(completion)
                }, receiveValue: { response in
                    self.transactions = response.transactions
                })
                .store(in: &cancellables)
        }
    }
}
