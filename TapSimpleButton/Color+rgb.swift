//
//  Color+rgb.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Color {
    
    static func rgb(_ r: Double, _ g: Double, _ b: Double) -> Color{
        return Color(red: r / 255, green: g / 255, blue: b / 255, opacity: 1.0)
    }
    
    static var fontColor: Color {
        return Color.rgb(51, 51, 51)
    }
    
    static var headerColor: Color {
        return Color.rgb(144, 204, 240)
    }
    
    static var backGroundColor: Color {
        return Color.rgb(252, 251, 246)
    }
}
