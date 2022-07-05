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
            Account(title: "収入", borderColor: Color.rgb(148, 196, 122)),
            Account(title: "接待交際費", borderColor: Color.rgb(173, 124, 229)),
            Account(title: "旅費交通費", borderColor: .green)
        ],
        [
            Account(title: "消耗品", borderColor: Color.rgb(237, 127, 123)),
            Account(title: "通信費", borderColor: Color.rgb(123, 206, 250)),
            Account(title: "会議費", borderColor: Color.rgb(243, 177, 116))
        ],
        [
            Account(title: "法定福利費", borderColor: Color.rgb(243, 177, 116)),
            Account(title: "前回の取引", borderColor: Color.gray),
            Account(title: "その他", borderColor: .gray)
        ]
    ]
}
