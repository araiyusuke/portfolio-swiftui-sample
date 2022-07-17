//
//  TapSimpleButtonApp.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/01.
//

import SwiftUI
import ViewAdjustSize

func adjust(_ targetSize: CGFloat) -> CGFloat {
    let originalSize: CGSize = .init(width: 375, height: 812)
    return ViewAdjustSize.convert(targetSize, originalSize)
}

@main
struct TapSimpleButtonApp: App {
    var body: some Scene {
        WindowGroup {
            Controller(container: AppEnvironment.bootstrap().container)
                .environmentObject(Router.shared)
                .environmentObject(TransactionInputRouter.shared)
                .environmentObject(Header())
                .environmentObject(BottomTabManager.shared)
                .environment(\.adjustOriginalSize, .init(size: CGSize(width: 375, height: 812), debug: false))
        }
    }
}
