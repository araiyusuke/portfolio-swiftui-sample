//
//  CircleButtonModifier.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

struct CircleButtonModifier: ViewModifier {
    
    var color: Color
    var size: CGFloat
    var borderColor: Color
    var borderSize: CGFloat
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                ZStack {
                    Circle()
                        .foregroundColor(borderColor)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    Circle()
                        .foregroundColor(color)
                        .frame(width: geometry.size.width - borderSize, height: geometry.size.height - borderSize)
                    content
                }
            }
            .frame(width: size, height: size)
        }
    }
}
