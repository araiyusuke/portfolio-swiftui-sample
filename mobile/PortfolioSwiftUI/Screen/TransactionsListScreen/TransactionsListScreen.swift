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
    @State private var sort: Sort = .new
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var bottomTab: BottomTabManager
    @EnvironmentObject var header: Header
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    listInfo
                    listDispOptions
                    content
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .onAppear {
                    viewModel.fetchTransactions()
                }
                .customNavigation(center: "取引一覧")
            }
            .onAppear {
                // NaivgationViewでOnAppearだと戻ってきた時に、TransactionsListScreen.onAppearにはならなかった
                bottomTab.show()
            }
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
            NavigationLink(
                destination:
                    TransactionsDetailScreen( viewModel: .init(
                        container: viewModel.container,
                        transaction: viewModel.transactionsList[index])
                    ),
                label: {
                    ZStack {
                        Text(viewModel.transactionsList[index].accounts)
                            .customFont(size: adjust(12), spacing: .none, weight: .light)
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                            }
                            .frame(maxWidth: 7, maxHeight: .infinity)
                            .background(viewModel.transactionsList[index].color)
                            .padding(.vertical, 2)
                            VStack(spacing: 10) {
                                HStack(spacing: 0) {
                                    Text(viewModel.transactionsList[index].date)
                                        .customFont(size: adjust(12), spacing: .none, weight: .light)
                                    Spacer()
                                    Text("¥\(viewModel.transactionsList[index].price)")
                                        .customFont(size: adjust(12), spacing: .none, weight: .light)
                                }
                                HStack(spacing: 0) {
                                    Text(viewModel.transactionsList[index].description ?? "摘要未入力")
                                        .customFont(size: adjust(13), spacing: .none, weight: .light)
                                    Spacer()
                                    viewModel.transactionsList[index].image
                                }
                            }
                            .padding(.leading, adjust(5))
                        }
                    }
                }
            )
            .isDetailLink(false)
            .listRowBackground(Color.white)
            .listRowInsets(EdgeInsets())
        }
        .padding(0)
        .environment(\.defaultMinListRowHeight, 78)
        .listStyle(PlainListStyle())
    }
    func failedView(_ error: Error) -> some View {
        Text(error.localizedDescription)
    }
}

extension TransactionsListScreen {
    /// 画面上の検索ボタン
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
            Text("科目: すべて")
                .customFont(size: adjust(14), spacing: .short, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("取引日: 2021/01/01 〜 2022/07/04")
                .customFont(size: adjust(14), spacing: .short, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("検索結果: \(viewModel.searchCount)件")
                .customFont(size: adjust(14), spacing: .short, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(adjust(5))
        .frame(maxWidth: .infinity)
        .background(Color.rgb(205, 230, 237))
    }
}

extension TransactionsListScreen {
    /// リストのオプション(検索、ソート)
    var listDispOptions: some View {
        HStack {
            sort.icon
            Text(sort.description)
                .customFont(size: 13, spacing: .short, weight: .light)
                .onButtonTap {
                    sort.toggle()
                }
            Spacer()
            searchButton
                .onButtonTap {
                }
        }
        .adjustPadding(.horizontal, 5)
        .adjustPadding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: adjust(40), alignment: .leading)
    }
}
