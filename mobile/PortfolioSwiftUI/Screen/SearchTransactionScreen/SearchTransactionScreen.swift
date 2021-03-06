//
//  SearchTransactionScreen.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/20.
//

import SwiftUI
import Combine
extension SearchTransactionScreen {
    class ViewModel: ObservableObject {
        // ボトムシートの表示管理
        @Published private var isShowBottomSheet: Bool = false
        @Published var bottomSheetState: BottomSheetState?
        private var cancellables = Set<AnyCancellable>()
        let container: DIContainer
        init(container: DIContainer) {
            self.container = container
        }
        private let subject = PassthroughSubject<[Transaction], Never>()
        var dismissHandle: AnyPublisher<[Transaction], Never> {
            subject.eraseToAnyPublisher()
        }
        public func search() {
            container.services.transaction.search()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    print(completion)
                }, receiveValue: { response in
                    self.subject.send(response.transactions)
                })
                .store(in: &cancellables)
        }
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
    }
}

struct SearchTransactionScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var bottom: BottomTabManager
    @EnvironmentObject var header: HeaderManager
    @StateObject var viewModel: ViewModel
    @State var accounts: String = "すべて"
    @State var startDate: String = "2021/01/01"
    @State var endDate: String = "2021/07/20"
    @Binding var transactions: [Transaction]

    var body: some View {
        VStack {
            HStack {
                Text("検索条件")
                    .customFont(size: 14, spacing: .none, rgb: Asset.lightGray.color, weight: .light)

                Spacer()
            }
            .adjustSize(height: 35)
            .padding(adjust(10))

            List {
                ListRow(title: "科目", value: $accounts)
                ListRow(title: "取引日(いつから)", value: $startDate)
                ListRow(title: "取引日(いつまで)", value: $endDate)
            }
            .background(Asset.screenBackColor.color)
            .listStyle(.plain)
            .adjustSize(height: 200)
            .onAppear {
                UITextView.appearance().backgroundColor = .clear
            }.onDisappear {
                UITextView.appearance().backgroundColor = nil
            }

            searchButton
                .onButtonTap {
                    viewModel.search()
                }


        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Asset.screenBackColor.color)
        .customNavigation(leading: L10n.back, center: "取引検索")
        .onAppear {
            // 取引検索画面にボトムメニューは不要
            bottom.hide()
        }
        .onReceive(viewModel.dismissHandle) { value in
            self.transactions = value
            presentationMode.wrappedValue.dismiss()
        }
    }

    /// 検索ボタン(科目と日付)
    var searchButton: some View {
        Text("検索")
            .customFont(size: 16, spacing: .long, rgb: Asset.lightBlue.color, weight: .light)
            .frame(maxWidth: .infinity, maxHeight: adjust(40))
            .background(Asset.listBack.color)
    }
    enum BottomSheetState {
        // いつから
        case start
        // いつまで
        case finish
    }
}
