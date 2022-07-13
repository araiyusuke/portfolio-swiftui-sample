//
//  View+backgroundCircle.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

extension View {
    func backgroundCircle(_ color: Color, _ size: CGFloat, _ borderColor: Color, _ borderSize: CGFloat ) -> some View {
        GeometryReader { geometry in
            modifier(
                CircleButtonModifier(
                    color: color,
                    size: size,
                    borderColor: borderColor,
                    borderSize: borderSize
                )
            )
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
