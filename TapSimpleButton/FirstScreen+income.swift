//
//  FirstScreen+income.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

extension FirstScreen {
    static let income = [
        
        [
            Account(title: "雑収入", borderColor: .blue),
            Account(title: "売上", borderColor: .red),
            Account(title: "家事消費", borderColor: .green)
        ],
        [
            nil,
            nil,
            nil
        ],
        [
            nil,
            Account(title: "前回の取引", borderColor: Color.gray, boderSize: 5),
            nil
        ]
    ]
}
