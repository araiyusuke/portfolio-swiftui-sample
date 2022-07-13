//
//  Color+rgb.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Color {
    
    static func rgb(_ red: Double, _ green: Double, _ blue: Double, _ alpha: CGFloat = 1.0) -> Color {
        return Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: alpha)
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
    
    static func hex( hexString : String, alpha : CGFloat) -> Color {
       let string = hexString.replacingOccurrences(of: "#", with: "")
       let scanner = Scanner(string: hexString as String)
       var color: UInt32 = 0
       if scanner.scanHexInt32(&color) {
           let red = CGFloat((color & 0xFF0000) >> 16)
           let green = CGFloat((color & 0x00FF00) >> 8)
           let blue = CGFloat(color & 0x0000FF)
           return Color.rgb(red, green, blue, alpha)
       } else {
           return Color.white
           
       }
   }
}
