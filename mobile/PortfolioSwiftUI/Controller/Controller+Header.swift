//
//  Controller+Header.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "yyyy/M/d"
        return dateFormatter.string(from: Date())
    }
    var headerTop: some View {
        Group {
            switch router.screen {
            case .transactionInput:
                switch transactionInputRouter.screen {
                case .first:
                    VStack {
                        Text("白色申告")
                            .customFont(size: adjust(28), spacing: .short, color: .white, weight: .light)
                            .frame(height: adjust(30))
                        Text(header.getTitle())
                            .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                            .frame(height: adjust(30))
                    }
                    .frame(alignment: .center)
                case .second:
                    VStack {
                        Text(header.getAccount()?.name ?? "")
                            .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                            .frame(height: adjust(20))
                        Text("取引先・\(L10n.descriptions)入力")
                            .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                            .frame(height: adjust(30))
                    }
                    .frame(alignment: .top)
                case .third:
                    VStack(spacing: 0) {
                        Text(header.getAccount()?.name ?? "")
                            .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                            .adjustSize(height: 20)
                        Text(dateString)
                            .customFont(size: 19, spacing: .short, rgb: Asset.moneyYellow.color, weight: .bold)
                            .adjustSize(height: 30)
                        Text("¥ \(header.getNumPad().isEmpty ? "0" : header.getNumPad())")
                            .customFont(size: 24, spacing: .short, rgb: Asset.moneyYellow.color, weight: .bold)
                            .adjustSize(height: 30)
                    }
                    .frame(alignment: .top)
                }
            case .setting:
                Text(L10n.settings)
                    .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                    .adjustSize(height: 20)
            case .transactionList:
                Text(L10n.transactions)
                    .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                    .adjustSize(height: 20)
            case .receipt:
                Text("レシート")
                    .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                    .adjustSize(height: 20)
            case .help:
                Text(L10n.help)
                    .customFont(size: 14, spacing: .short, color: .white, weight: .bold)
                    .adjustSize(height: 20)
            }
        }
    }
}
