//
//  FirstScreen+NextButton.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    var next: some View {
        Text("次へ 〉")
            .customFont(size: 18, spacing: .short, color: .dark, weight: .medium)
            .onTapGesture {
                switch router.screen {
                case .first:
                    moveForward(to: .second, router)
                case .second:
                    moveForward(to: .third, router)
                default:
                    return
                }
            }
    }
}
