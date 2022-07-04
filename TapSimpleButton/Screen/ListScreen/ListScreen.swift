//
//  ListScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import SwiftUI

struct ListScreen: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @State var selected = 0
    @State var sortDirection: Sort = .new
    
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
                
                Text("検索結果: 11件")
                    .customFont(size: 14, spacing: .short, rgb: Color.rgb(89,89,89), weight: .light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(5)
            .frame(maxWidth: .infinity)
            .background(Color.rgb(205, 230, 237))
            
            HStack() {
                
                sortDirection.icon
                
                Text(sortDirection.description)
                    .customFont(size: 15, spacing: .short, rgb: Color.rgb(89,89,89), weight: .light)
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
            
            List {
                ForEach(Self.transactions) { transaction in
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
