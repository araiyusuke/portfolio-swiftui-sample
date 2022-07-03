//
//  FirstScreen+spending.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

extension FirstScreen {

    static let spending = [
        [
            Account(title: "収入", borderColor: .blue),
            Account(title: "接待交際費", borderColor: .red),
            Account(title: "旅費交通費", borderColor: .green)
        ],
        [
            Account(title: "消耗品", borderColor: .orange),
            Account(title: "通信費", borderColor: .pink),
            Account(title: "会議費", borderColor: Color.red)
        ],
        [
            Account(title: "法定福利費", borderColor: .blue),
            Account(title: "前回の取引", borderColor: Color.gray),
            Account(title: "その他", borderColor: .gray)
        ]
    ]
}
