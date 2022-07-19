//
//  SearchTransactionScreen.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/20.
//

import SwiftUI

struct SearchTransactionScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var header: HeaderManager
    var body: some View {
        VStack {

            HStack {
                rowLabel("検索条件")
                Spacer()
            }
            .adjustSize(height: 35)
            .padding(adjust(10))

            List {
                HStack {
                    rowLabel("科目")
                    Spacer()
                    rowLabel("すべて")
                }
                HStack {
                    rowLabel("取引日(いつから)")
                    Spacer()
                    rowLabel("2021/01/01")
                }
                HStack {
                    rowLabel("取引日(いつまで)")
                    Spacer()
                    rowLabel("2021/07/20")
                }
            }
            .listStyle(.plain)
            .adjustSize(height: 200)
            searchButton
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.rgb(240, 240, 240))
    }

    func rowLabel(_ title: String) -> some View {
        Text(title)
            .customFont(size: 14, spacing: .none, rgb: Asset.lightGray.color, weight: .light)
    }
    var searchButton: some View {
        Text("検索")
            .customFont(size: 16, spacing: .long, rgb: Asset.lightBlue.color, weight: .light)
            .adjustPadding(.all, 13)
            .frame(maxWidth: .infinity)
            .background(.white)
    }
}

struct SearchTransactionScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchTransactionScreen()
    }
}
