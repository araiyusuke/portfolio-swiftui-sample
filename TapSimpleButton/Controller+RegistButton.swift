//
//  Controller+RegistButton.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    var regist: some View {
        Text("登録")
            .customFont(size: 18, spacing: .short, color: .light, weight: .bold)
            .frame(width: 70, height: 40)
            .foregroundColor(.white)
            .background(Color.rgb(99, 187, 235))
            .cornerRadius(3)
            .onTapGesture {
                moveForward(to: .second, router)
            }
    }
}

