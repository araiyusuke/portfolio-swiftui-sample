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
            .customFont(size: 15, spacing: .short, color: .light, weight: .bold)
            .frame(width: 64, height: 32)
            .background(Color.rgb(99, 187, 235))
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.white, lineWidth: 3))
            .cornerRadius(5)
            .frame(width: 68, height: 36)
            .background(Color.rgb(99, 187, 235))
            .cornerRadius(7)
            .onTapGesture {
                moveForward(to: .first, router)
            }
    }
}

