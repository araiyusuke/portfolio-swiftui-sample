//
//  View+PullDown.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/08.
//

import SwiftUI

struct PullDown: View {
    var body: some View {
        Image("pull_down")
            .resizable()
            .frame(width: 18, height: 20)
            .frame(width: 40, height: 40)
            .background(Color.headerColor)
            .cornerRadius(5)
    }
}
