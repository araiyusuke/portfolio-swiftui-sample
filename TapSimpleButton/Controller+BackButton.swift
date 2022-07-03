//
//  Controller+Back.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    var back: some View {
        Text("〈 戻る")
            .customFont(size: 18, spacing: .short, color: .dark, weight: .medium)
            .onTapGesture {
                moveForward(to: .second, router)
            }
    }
}
