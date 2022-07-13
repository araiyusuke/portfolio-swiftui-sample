//
//  Text+Font.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

extension Text {
    
    enum ColorModel {
        case light, dark
    }
    
    enum Weight: String {
        case medium = "Medium"
        case bold = "Bold"
        case regular = "Regular"
        case light = "Light"
    }
    
    enum FontType: String {
        case notosans = "NotoSansJP"
        case roboto = "Roboto"
    }
    
    enum LetterSpacing {
        
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
        spacing: LetterSpacing = .default,
        rgb: Color,
        weight: Text.Weight,
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
        spacing: LetterSpacing = .default,
        color: ColorModel = .dark,
        weight: Text.Weight,
        line: CGFloat = 8
    ) -> some View {
        
        self
            .font(Font.custom("\(font.rawValue)-\(weight.rawValue)", size: size))
            .kerning(spacing.size)
            .foregroundColor(color == .light ? .white : .black)
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

