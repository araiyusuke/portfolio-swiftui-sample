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
        private let subject = PassthroughSubject<String, Never>()
        var dismissHandle: AnyPublisher<String, Never> {
            subject.eraseToAnyPublisher()
        }
        public func search() {
            self.subject.send("検索結果一覧")
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
            .listStyle(.plain)
            .adjustSize(height: 200)

            List {
                searchButton
                    .onButtonTap {
                        viewModel.search()
                    }
            }
            .listStyle(.plain)

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.rgb(240, 240, 240))
        .onAppear {
            // 取引検索画面にボトムメニューは不要
            bottom.hide()
        }
        .onReceive(viewModel.dismissHandle) { value in
            header.showToast(title: value)
            presentationMode.wrappedValue.dismiss()
        }
    }

    /// 検索ボタン(科目と日付)
    var searchButton: some View {
        Text("検索")
            .customFont(size: 16, spacing: .long, rgb: Asset.lightBlue.color, weight: .light)
            .frame(maxWidth: .infinity)
    }
}
