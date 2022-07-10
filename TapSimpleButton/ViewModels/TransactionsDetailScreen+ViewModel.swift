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

        // ボトムシートの表示管理
        @Published private var isShowBottomSheet: Bool = false
        
        // 何をボトムシート経由で編集するのか?(date or accounts)管理する
        @Published var bottomSheetState: BottomSheetState?
        
        // Picker
        @Published var selectionDate = Date()
        
        @Published var transaction: Transaction
        
        public func showBottomSheets(_ bottomSheetState: BottomSheetState?) {
            self.bottomSheetState = bottomSheetState
            self.isShowBottomSheet = true
        }
        
        public func showBottomSheets(_ bottomSheetState: BottomSheetState?, date: Date) {
            self.bottomSheetState = bottomSheetState
            self.isShowBottomSheet = true
        }
        
        public func closeBottomSheets() {
            self.isShowBottomSheet = false
        }
        
        public var isOpenBottomSheets: Bool {
            return isShowBottomSheet
        }
        
        public func onAppear() {
            
        }
        
        private func convertString(date: Date) -> String {
            let formatter: DateFormatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = TransactionDate.dateFormat
            return formatter.string(from: date)
        }
        
        public func pickerChange(date: Date) {
            self.transaction.date = convertString(date: date)
        }
        
        
        
        private var cancellables = Set<AnyCancellable>()
        
        init(container: DIContainer, transaction: Transaction) {
            self.container = container
            self.transaction = transaction
        }
        
        public var accounts: [Account] {
            return Account.all()
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
