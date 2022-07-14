//
//  FirstScreen+NextButton.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension TransactionInputScreen {
    var next: some View {
        Text("次へ 〉")
            .customFont(size: 18, spacing: .short, weight: .medium)
            .onTapGesture {
                switch router.screen {
                case .first:
                    moveForward(screen: .second, router)
                case .second:
                    moveForward(screen: .third, router)
                case .third:
                    moveBack(screen: .first, router)
                }
            }
    }
}
