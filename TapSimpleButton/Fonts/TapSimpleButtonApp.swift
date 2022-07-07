//
//  TapSimpleButtonApp.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/01.
//

import SwiftUI

@main
struct TapSimpleButtonApp: App {
    var body: some Scene {
        WindowGroup {
            
            Controller(container: AppEnvironment.bootstrap().container)
                .environmentObject(Router.shared)
                .environmentObject(TransactionInputRouter.shared)
                .environmentObject(Header())
            
        }
    }
}
