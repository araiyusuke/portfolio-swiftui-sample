//
//  ListRow.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/20.
//

import SwiftUI

struct ListRow: View {
    let title: String
    @Binding var value: String
    var body: some View {
        HStack {
            Text(title)
                .customFont(size: 14, spacing: .none, rgb: Asset.lightGray.color, weight: .light)
            Spacer()
            Text(value)
                .customFont(size: 14, spacing: .none, rgb: Asset.lightGray.color, weight: .light)
        }

    }
}
