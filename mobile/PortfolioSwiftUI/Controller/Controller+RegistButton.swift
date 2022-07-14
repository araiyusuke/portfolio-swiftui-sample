//
//  Controller+RegistButton.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension TransactionInputScreen {
    var regist: some View {
        Text("登録")
            .customFont(size: 15, spacing: .short, color: .white, weight: .bold)
            .frame(width: 64, height: 32)
            .background(Asset.lightBlue.color)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.white, lineWidth: 3))
            .cornerRadius(5)
            .frame(width: 68, height: 36)
            .background(Asset.lightBlue.color)
            .cornerRadius(7)
            .onButtonTap {
                viewModel.registTransaction {
                    header.showToast(title: "取引を登録しました")
                    moveBack(screen: .first, router)
                }
            }
    }
}
