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
    /// 16進数からColorに変換する
    /// - Parameters:
    ///   - hexString: 16進数
    ///   - alpha: 透明度
    /// - Returns: Color
    static func hex(hexString: String, alpha: CGFloat) -> Color? {
        var rgb: UInt64 = 0
        let scanner = Scanner(string: hexString as String)
        var color: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&rgb) else {
            return nil
        }
        scanner.scanHexInt64(&color)
        let red = CGFloat((color & 0xFF0000) >> 16)
        let green = CGFloat((color & 0x00FF00) >> 8)
        let blue = CGFloat((color & 0x0000FF))
        return Color.rgb(red, green, blue, alpha)
    }
}
