//
//  FirstScreen+Account.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

struct Account: Identifiable, Hashable {
    
    var id = UUID()
    var name: String
    var color: Color
    var boderSize: CGFloat = 3
    
    func view(selected: Bool) -> some View {
        Text(name)
            .customFont(size: 11, spacing: .short, color: .dark, weight: .light)
            .backgroundCircle(selected ? color : .white, 82, color, boderSize)
    }
    
    
    static func all() -> [Account] {
        
        [
            Account(name: "仕入", color: Color.rgb(148, 196, 122)),
            Account(name: "接待交際費", color: Color.rgb(173, 124, 229)),
            Account(name: "旅費交通費", color: .green),
            Account(name: "通信費", color: Color.rgb(123, 206, 250)),
            Account(name: "雑費費", color: Color.rgb(123, 206, 250)),
            Account(name: "荷造運賃", color: Color.rgb(237, 127, 123)),
            Account(name: "消耗品", color: Color.rgb(237, 127, 123)),
            Account(name: "会議費", color: Color.rgb(243, 177, 116)),
            Account(name: "法定福利費", color: Color.rgb(243, 177, 116)),
            Account(name: "福利厚生費", color: Color.rgb(243, 177, 116)),
            Account(name: "広告宣伝費", color: Color.rgb(243, 177, 116)),
            Account(name: "修繕費", color: Color.rgb(243, 177, 116)),
            Account(name: "水道光熱費", color: Color.rgb(243, 177, 116)),
            Account(name: "新聞図書費", color: Color.rgb(243, 177, 116)),
            Account(name: "諸会費", color: Color.rgb(243, 177, 116)),
            Account(name: "支払手数料", color: Color.rgb(243, 177, 116)),
            Account(name: "車両費", color: Color.rgb(243, 177, 116)),
            Account(name: "地代家賃", color: Color.rgb(243, 177, 116)),
            Account(name: "租税効果", color: Color.rgb(243, 177, 116)),
            Account(name: "損害保険料", color: Color.rgb(243, 177, 116)),
            Account(name: "給料賃金", color: Color.rgb(243, 177, 116)),
            Account(name: "外注工賃", color: Color.rgb(243, 177, 116)),
            Account(name: "利子割引料", color: Color.rgb(243, 177, 116)),
            Account(name: "研修費", color: Color.rgb(243, 177, 116)),
            Account(name: "税理士・弁護士報酬", color: Color.rgb(243, 177, 116)),
            Account(name: "専従者給与", color: Color.rgb(243, 177, 116)),
        ]
    }
}
