//
//  KeyPadButton.swift
//  swiftui_test
//
//  Created by 名前なし on 2021/09/01.
//

import SwiftUI

struct KeyPadButton: View {
    @Environment(\.keyPadButtonAction)
    var action: (NumberPad.Key) -> Void
    enum ActionKey: EnvironmentKey {
        static var defaultValue: (NumberPad.Key) -> Void { { _ in } }
    }
    var key: NumberPad.Key
    init(_ key: NumberPad.Key) {
        self.key = key
    }
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                self.action(key)
            }, label: {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .adjustSize(width: 90, height: 90)
                        .overlay(
                            Circle()
                                .stroke(.gray, lineWidth: adjust(1))
                                .adjustSize(width: 90, height: 90)
                        )
                    key.label
                }
            })
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
