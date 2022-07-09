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
        
//        NavigationView {
            
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("取引一覧")
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.transactions {
        case .notRequested:
            loadedView()
        case .isLoading:
            loadingView
        case let .loaded(transactions):
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
        
        List(viewModel.transactionsList.indices, id:\.self) { index in
            
            NavigationLink(
                destination:
                    
                    TransactionsDetailScreen(transaction:$viewModel.transactionsList[index])
//                        .environment(\.resizableSheetCenter, resizableSheetCenter)

                
                ,
                label: {
                    ZStack {
                        
                        Text(viewModel.transactionsList[index].accounts)
                            .customFont(size: 12, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
                        
                        HStack(spacing: 0) {
                            
                            VStack(spacing: 0) {
                                
                            }
                            .frame(maxWidth: 7, maxHeight: .infinity)
                            .background(viewModel.transactionsList[index].color)
                            .padding(.vertical, 2)
                            
                            
                            VStack (spacing: 10) {
                                
                                HStack(spacing: 0) {
                                    
                                    Text(viewModel.transactionsList[index].date)
                                        .customFont(size: 12, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
                                    
                                    Spacer()
                                    
                                    Text("¥\(viewModel.transactionsList[index].price)")
                                        .customFont(size: 12, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
                                    
                                }
                                
                                HStack(spacing: 0) {
                                    Text(viewModel.transactionsList[index].description ?? "適用未入力")
                                        .customFont(size: 13, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
                                    
                                    Spacer()
                                    
                                    viewModel.transactionsList[index].image
                                    
                                }
                            }
                            .padding(.leading, 5)
                            
                            //                rightArrow
                            //                    .frame(width: 30)
                        }
                    }
                }
                
            )
            .isDetailLink(false)

            
            .swipeActions(edge: .trailing) {
                HStack {
                    
                    Button(role: .destructive) {
                    } label: {
                        Text("削除")
                    }
                    
                    Button(role: .none ) {
                    } label: {
                        Text("コピー")
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

