//
//  Transaction.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine
import SwiftUI

struct Transactions: Mockable, Hashable {
    var transactions: [Transaction]
}

struct TransactionDate {
    static let dateFormat: String = "yyyy/MM/dd"
}

struct Transaction: Mockable, Hashable, Identifiable {
    var id: Int
    var accounts: String
    var date: String
    var price: Int
    var hex: String
    var supplier: String?
    var description: String?
    /// リスト左脇にある摘要のカラー
    var color: Color {
        Color.hex(hexString: hex, alpha: 0.3) ?? Asset.lightGray.color.opacity(0.3)
    }
    var pickerDate: Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = TransactionDate.dateFormat
        return formatter.date(from: date) ?? Date()
    }
    var rightArrow: some View {
        Image(Asset.rightAllowIcon)
            .resizable()
            .frame(width: 10, height: 14)
    }
}
