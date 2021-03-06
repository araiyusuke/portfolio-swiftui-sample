//
//  FirstScreen+Footer.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension TransactionInputScreen {
    var horizontalLine: some View {
        Rectangle()
            .fill(Color.black)
    }
    static let naviItems = ["1", "2", "3"]
    static let alignments: [Alignment] = [.leading, .center, .trailing]
    static let all: [TransactionInput] = [.first, .second, .third]

    func isActive(_ index: Int) -> Bool {
        TransactionInputScreen.all[index] == router.screen
    }
    var navi : some View {
        VStack(spacing: 0) {
            ZStack {
                horizontalLine
                    .frame(maxWidth: .infinity, maxHeight: adjust(2))
                HStack(spacing: 0) {
                    ForEach(0..<Self.naviItems.count, id: \.self) { index in
                        VStack {
                            Text(Self.naviItems[index])
                                .foregroundColor(isActive(index) ? .white : .black)
                                .backgroundCircle(isActive(index) ? .black : .white, adjust(25), Asset.lightGray.color, 3)
                                .adjustSize(width: 25, height: 25)
                                .frame(maxWidth: .infinity, maxHeight: adjust(50), alignment: Self.alignments[index])
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: adjust(25))
            }
            .frame(maxWidth: .infinity, maxHeight: adjust(50))
            HStack {
                Text(L10n.account)
                    .customFont(size: adjust(11), spacing: .short, weight: .light)
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("取引先・\(L10n.descriptions)")
                    .customFont(size: adjust(10), spacing: .none, weight: .light)
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(L10n.price)
                    .customFont(size: adjust(11), spacing: .short, weight: .light)
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
