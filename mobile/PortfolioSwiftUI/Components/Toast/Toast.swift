//
//  Toast.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/10.
//

import SwiftUI

extension View {
    func toast() -> some View {
        modifier(Toast())
    }
}

struct Toast: ViewModifier {
    @EnvironmentObject var header: HeaderManager

    func body(content: Content) -> some View {
        ZStack {
            if header.isShowToast {
                VStack {
                    Text(header.toastTitle)
                        .customFont(size: 15, spacing: .none, weight: .light)
                }
                .frame(maxWidth: .infinity, maxHeight: adjust(100))
                .background(Asset.toastBack.color)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.gray.opacity(0.4))
                .zIndex(.infinity)
            }
            content
        }
    }
}
