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
            searchButton
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.rgb(240, 240, 240))
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
