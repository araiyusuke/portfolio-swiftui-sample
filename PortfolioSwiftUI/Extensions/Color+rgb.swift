//
//  Color+rgb.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Color {
    
    static func rgb(_ r: Double, _ g: Double, _ b: Double, _ alpha: CGFloat = 1.0) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255, opacity: alpha)
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
    
    static func hex( string : String, alpha : CGFloat) -> Color {
       let string_ = string.replacingOccurrences(of: "#", with: "")
       let scanner = Scanner(string: string_ as String)
       var color: UInt32 = 0
       if scanner.scanHexInt32(&color) {
           let r = CGFloat((color & 0xFF0000) >> 16)
           let g = CGFloat((color & 0x00FF00) >> 8)
           let b = CGFloat(color & 0x0000FF)
           return Color.rgb(r, g, b, alpha)
       } else {
           return Color.white;
       }
   }
}
