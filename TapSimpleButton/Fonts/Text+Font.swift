//
//  Text+Font.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

extension Text {
    
    enum color {
        case light, dark
    }
    
    enum weight: String {
        case medium = "Medium"
        case bold = "Bold"
        case regular = "Regular"
        case light = "Light"
    }
    
    enum FontType: String {
        case notosans = "NotoSansJP"
        case roboto = "Roboto"
    }
    
    enum letterSpacing {
        
        case none, short, `default`,  middle, long, veryLong
        
        var size: CGFloat {
            switch self {
            case .none:
                return 0
            case .short:
                return 1
            case .default:
                return 3
            case .middle:
                return 10
            case .long:
                return 20
            case .veryLong:
                return 30
            }
        }
    }
    
    func customFont(size: CGFloat) -> some View {
        self.modifier(CustomFont(size))
    }
    
    func customFont(
        font: FontType = .notosans,
        size: CGFloat,
        spacing: letterSpacing = .default,
        rgb: Color,
        weight: Text.weight,
        line: CGFloat = 8
    ) -> some View {
        
        self
            .font(Font.custom("\(font.rawValue)-\(weight.rawValue)", size: size))
            .kerning(spacing.size)
            .foregroundColor(rgb)
            .modifier(CustomFont(size))
    }

    func customFont(
        font: FontType = .notosans,
        size: CGFloat,
        spacing: letterSpacing = .default,
        color: Text.color = .dark,
        weight: Text.weight,
        line: CGFloat = 8
    ) -> some View {
        
        self
            .font(Font.custom("\(font.rawValue)-\(weight.rawValue)", size: size))
            .kerning(spacing.size)
            .foregroundColor(color == .light ? Color.white : Color.black)
            .modifier(CustomFont(size))
    }
}

struct CustomFont: ViewModifier {
    
    let size: CGFloat
    
    init(_ size: CGFloat) {
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .regular, design: .default))
    }
}

