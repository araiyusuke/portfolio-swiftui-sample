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
        Text("次へ＞")
            .foregroundColor(.black)
            .onTapGesture {
                moveForward(to: .second, router)
            }
    }
}
