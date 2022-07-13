//
//  Controller+Back.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension TransactionInputScreen {
    @ViewBuilder
    var back: some View {
        if router.screen != .first {
             Text("〈 戻る")
                .customFont(size: 18, spacing: .short, color: .dark, weight: .medium)
                .onTapGesture {
                    switch router.screen {
                    case .first:
                        return
                    case .second:
                        moveBack(screen: .first, router)
                    case .third:
                        moveBack(screen: .second, router)
                    }
                }
        }
    }
}
