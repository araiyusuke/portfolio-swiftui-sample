//
//  FirstScreen+income.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

extension FirstScreen {
    // 勘定 > 収入
    static let income = [
        
        [
            Account(name: "売上", color: Color.rgb(123, 206, 250)),
            Account(name: "家事消費", color: Color.rgb(245, 177, 116)),
            Account(name: "雑収入", color: Color.rgb(113, 214, 210)),
        ],
        [
            nil,
            nil,
            nil
        ],
        [
            nil,
            Account(name: "前回の取引", color: Color.rgb(184, 183, 179), boderSize: 5),
            nil
        ]
    ]
}
