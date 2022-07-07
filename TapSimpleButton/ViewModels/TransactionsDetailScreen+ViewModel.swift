//
//  TransactionsDetailScreen+ViewModel.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/08.
//

import Foundation
import SwiftUI
import Combine

extension TransactionsDetailScreen {
    
    class ViewModel: ObservableObject {
        
        let container: DIContainer
        private var cancellables = Set<AnyCancellable>()
        
        init(container: DIContainer) {
            self.container = container
        }
        
        func editSupplier( completion: @escaping () -> Void) {
                    
            container.services.transaction.regist()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    print(completion)
                }, receiveValue: { response in
                    if response.transactions.success {
                        completion()
                    }
                })
                .store(in: &cancellables)
        }
        
        
    }
}
