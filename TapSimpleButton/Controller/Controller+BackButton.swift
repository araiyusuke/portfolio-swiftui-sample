//
//  Controller+Back.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    @ViewBuilder
    var back: some View {
        if router.screen != .transactionInput(false) {
             Text("〈 戻る")
                .customFont(size: 18, spacing: .short, color: .dark, weight: .medium)
                .onTapGesture {
                    switch router.screen {
                    case .transactionInput:
                        return
                    case .second:
                        moveBack(to: .transactionInput(false), router)
                    case .third:
                        moveBack(to: .second, router)
                    case .setting:
                        return
                    case .list:
                        return
                    }
                }
        }
    }
}
