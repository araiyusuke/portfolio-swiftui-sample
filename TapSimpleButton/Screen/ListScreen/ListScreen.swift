//
//  ListScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import SwiftUI
import Combine

struct ListScreen: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @State var selected = 0
    @State var sortDirection: Sort = .new
    @ObservedObject private(set) var viewModel: ViewModel
    
    var searchCount: String {
        viewModel.count.description
    }
    
    var searchButton: some View {
        Image("search_icon")
            .resizable()
            .frame(width: 80, height: 28)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 5) {
                Text("科目: すべて")
                    .customFont(size: 14, spacing: .short, rgb: Color.rgb(89,89,89), weight: .light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("取引日: 2021/01/01 〜 2022/07/04")
                    .customFont(size: 14, spacing: .short, rgb: Color.rgb(89,89,89), weight: .light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("検索結果: \(searchCount)件")
                    .customFont(size: 14, spacing: .short, rgb: Color.rgb(89,89,89), weight: .light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(5)
            .frame(maxWidth: .infinity)
            .background(Color.rgb(205, 230, 237))
            
            HStack() {
                
                sortDirection.icon
                
                Text(sortDirection.description)
                    .customFont(size: 13, spacing: .short, rgb: Color.rgb(89,89,89), weight: .light)
                    .onButtonTap() {
                        sortDirection.toggle()
                    }
                
                Spacer()
                
                searchButton
                    .onButtonTap() {
                    }
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
            
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            viewModel.fetchTransactions()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.transactions {
        case .notRequested:
            notRequestedView
        case .isLoading:
            loadingView
        case let .loaded(transactions):
            loadedView(transactions: transactions)
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
    
    func loadedView(transactions: [Transaction]) -> some View {
        List {
            ForEach(transactions) { transaction in
                transaction.cell
                    .swipeActions(edge: .trailing) {
                        HStack {
                            
                            Button(role: .destructive) {
                            } label: {
                                Text("削除")
                            }
                            
                            Button(role: .none ) {
                                // 処理
                            } label: {
                                Text("コピー")
                            }
                        }
                        
                    }
            }
            .listRowBackground(Color.white)
            .listRowInsets(EdgeInsets())
        }
        .padding(0)
        .environment(\.defaultMinListRowHeight, 78)
        .listStyle(PlainListStyle())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func failedView(_ error: Error) -> some View {
        Text(error.localizedDescription)
    }
    
    
}

