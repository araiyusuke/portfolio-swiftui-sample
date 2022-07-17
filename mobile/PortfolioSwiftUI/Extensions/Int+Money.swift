//
//  Int+Money.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/17.
//

import Foundation

extension Int {
    var money: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ja_JP")
        return "¥" + (formatter.string(for: self) ?? "")
    }
}
