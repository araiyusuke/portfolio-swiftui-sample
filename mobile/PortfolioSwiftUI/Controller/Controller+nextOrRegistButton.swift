//
//  Controller+nextOrRegistButton.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/02.
//

import Foundation
import SwiftUI

extension TransactionInputScreen {
    @ViewBuilder
    var nextOrRegist: some View {
        if router.screen == .third {
            regist
        } else {
            next
        }
    }
}
