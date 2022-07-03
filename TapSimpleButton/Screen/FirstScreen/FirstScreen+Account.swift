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
    var title: String
    var borderColor: Color
    var boderSize: CGFloat = 3
    
    var view: some View {
        Text(title)
            .customFont(size: 11, spacing: .short, color: .dark, weight: .light)
            .backgroundCircle(.white, 82, borderColor, boderSize)
    }

}
