//
//  ButtonTapModifier.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/03.
//

import Foundation
import SwiftUI

struct ButtonTapModifier: ViewModifier {
    var onTapped: (() -> Void)
    func body(content: Content) -> some View {
        Button(action:
            self.onTapped
        ) {
            content
        }
    }
}

extension View {
    public func onButtonTap(_ onTapped: @escaping (() -> Void)) -> some View {
        self.modifier(ButtonTapModifier(onTapped: onTapped))
    }
}
