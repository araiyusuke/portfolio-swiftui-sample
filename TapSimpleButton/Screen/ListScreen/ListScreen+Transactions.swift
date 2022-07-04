//
//  ListScreen+Transactions.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import SwiftUI

extension ListScreen {
    static let transactions: [Transaction] = [
        Transaction(accounts: "接待交際費", date: "2022/07/03", price: 120, hex: "#ffffff", supplier: "セブン" , description: "コーヒー"),
        Transaction(accounts: "通信費", date: "2022/07/03", price: 20, hex: "#ff0000", supplier: "ファミリーマート" , description: "コピー代"),
        Transaction(accounts: "接待交際費", date: "2022/07/01", price: 654, hex: "#3cb371", supplier: "ドトール" , description: "打ち合わせ"),
        Transaction(accounts: "接待交際費", date: "2022/07/03", price: 0, hex: "#ff0000", supplier: "セブン" , description: "コーヒー"),
        Transaction(accounts: "雑費", date: "2022/07/03", price: 110, hex: "#3cb371", supplier: "ダイソー" , description: nil),
        
    ]
}
