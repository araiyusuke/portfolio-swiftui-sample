//
//  View+PullDown.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/08.
//

import SwiftUI

struct PullDown: View {
    var body: some View {
        Image(Asset.pullDown)
            .resizable()
            .adjustSize(width: 18, height: 20)
            .adjustSize(width: 40, height: 40)
            .background(Asset.lightBlue.color)
            .cornerRadius(adjust(5))
    }
}
