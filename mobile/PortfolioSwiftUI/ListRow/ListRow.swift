//
//  ListRow.swift
//  PortfolioSwiftUI
//
//  Created by ććăȘă on 2022/07/20.
//

import SwiftUI

struct ListRow: View {
    let title: String
    @Binding var value: String
    var body: some View {
        HStack {
            Text(title)
                .customFont(size: 14, spacing: .none, color: .lightGray, weight: .light)
            Spacer()
            Text(value)
                .customFont(size: 14, spacing: .none, rgb: Asset.lightGray.color, weight: .light)
        }
        .listRowBackground(Asset.listBack.color)
    }
}
