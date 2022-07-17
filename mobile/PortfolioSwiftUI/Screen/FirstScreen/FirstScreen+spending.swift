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
            Account(name: "仕入", color: Color.rgb(148, 196, 122)),
            Account(name: "接待交際費", color: Color.rgb(173, 124, 229)),
            Account(name: "旅費交通費", color: .green)
        ],
        [
            Account(name: "通信費", color: Color.rgb(123, 206, 250)),
            Account(name: "消耗品", color: Color.rgb(237, 127, 123)),
            Account(name: "会議費", color: Color.rgb(243, 177, 116))
        ],
        [
            Account(name: "法定福利費", color: Color.rgb(243, 177, 116)),
            Account(name: "前回の取引", color: Color.gray),
            Account(name: L10n.others, color: .gray)
        ]
    ]
}
