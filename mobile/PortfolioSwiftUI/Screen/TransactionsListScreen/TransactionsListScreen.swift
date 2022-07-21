//
//  ListScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import SwiftUI
import Combine

struct TransactionsListScreen: View {
    @State private var sort: Sort = .old
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var bottomTab: BottomTabManager
    @EnvironmentObject var header: HeaderManager
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    listInfo
                    listDispOptions
                    content
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Asset.screenBackColor.color)
                .customNavigation(center: "取引一覧")
            }
            .onAppear {
                bottomTab.show()
            }
        }.onAppear {
            // 戻ってきた時にNavigationViewの外に出さないとAPIが繰り返し呼び出される
            viewModel.fetchTransactions()
        }
    }
    @ViewBuilder
    private var content: some View {
        switch viewModel.transactions {
        case .notRequested:
            loadedView()
        case .isLoading:
            loadingView
        case .loaded:
            loadedView()
        case let .failed(error):
            failedView(error)
        }
    }
    var notRequestedView: some View {
        Text("リクエスト中...")
    }
    var loadingView: some View {
        Text("ローディング...")
    }
    func loadedView() -> some View {
        List(viewModel.transactionsList.indices, id: \.self) { index in
            let account = viewModel.transactionsList[index].accounts
            let color = viewModel.transactionsList[index].color
            let date = viewModel.transactionsList[index].date
            let price = viewModel.transactionsList[index].price
            NavigationLink(
                destination:
                    TransactionsDetailScreen(viewModel: .init(
                        container: viewModel.container,
                        transaction: viewModel.transactionsList[index])
                    ),
                label: {
                    HStack(spacing: 0) {
                        // リスト左脇にある摘要別カラー
                        verticalLine(
                            color: color
                        )
                        VStack(spacing: 10) {
                            // 横 -> 日付 摘要 金額
                            HStack(spacing: 0) {
                                // 入力日
                                label(text: date)
                                Spacer()
                                // 摘要
                                label(text: account)
                                Spacer()
                                label(text: price.money)
                            }
                            HStack(spacing: 0) {
                                    Text(viewModel.transactionsList[index].description ?? "\(L10n.descriptions)未入力")
                                        .customFont(size: adjust(13), spacing: .none, weight: .light)
                                    Spacer()
                                    // 鉛筆マーク
                                    pencilMarkForEdit
                                }
                            }
                            .padding(.leading, adjust(5))
                        }
                }
            )
            .isDetailLink(false)
            .listRowBackground(Asset.listBack.color)
            .listRowInsets(EdgeInsets())
            .buttonStyle(PlainButtonStyle())
        }
        .adjustPadding(.trailing, 10)
        .environment(\.defaultMinListRowHeight, 78)
        .listStyle(PlainListStyle())
    }
    /// 色がついkた縦線
    func verticalLine(color: Color) -> some View {
        color
            .frame(maxWidth: 7, maxHeight: .infinity)
            .padding(.vertical, 2)
    }
    /// リストラベル
    func label(text: String) -> some View {
        Text(text)
            .customFont(size: adjust(13), spacing: .none, weight: .light)
    }
    /// 編集可能であることを伝えるための鉛筆マーク
    var pencilMarkForEdit: some View {
        Image(Asset.pencilIcon)
            .resizable()
            .adjustSize(width: 20, height: 20)
    }
    func failedView(_ error: Error) -> some View {
        Text(error.localizedDescription)
    }
}

extension TransactionsListScreen {
    /// 検索画面に遷移するボタン
    var searchButton: some View {
        Image(Asset.searchIcon)
            .resizable()
            .adjustSize(width: 80, height: 28)
    }
}

extension TransactionsListScreen {
    /// リストの情報(科目、取引日、検索結果)
    var listInfo: some View {
        VStack(spacing: adjust(5)) {
            Text("\(L10n.account): すべて")
                .customFont(size: adjust(14), spacing: .short, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("取引日: 2021/01/01 〜 2022/07/04")
                .customFont(size: adjust(14), spacing: .short, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(L10n.search)結果: \(viewModel.searchCount)件")
                .customFont(size: adjust(14), spacing: .short, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(adjust(5))
        .frame(maxWidth: .infinity)
        .background(Asset.lightBlue.color.opacity(0.4))
    }
}

extension TransactionsListScreen {
    /// リストのオプション(検索、ソート)
    var listDispOptions: some View {
        HStack {
            sort.icon
            Text(sort.description)
                .customFont(size: 13, spacing: .short, color: .lightGray, weight: .light)
                .onButtonTap {
                    sort.toggle()
                    viewModel.transactionsList = viewModel.transactionsList.sorted(by: {
                        $0.date.compare($1.date) == sort.orderBy
                    })
                }
            Spacer()
            NavigationLink(
                destination:
                    SearchTransactionScreen(
                        viewModel: .init(container: self.viewModel.container), transactions: $viewModel.transactionsList),
                label: {
                    searchButton
                })
        }
        .adjustPadding(.horizontal, 5)
        .adjustPadding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: adjust(40), alignment: .leading)
        .background(Asset.listBack.color)
    }
}
