//
//  AppEnvironment.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/05.
//

import Foundation

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let diContainer = DIContainer()
        return AppEnvironment(container: diContainer)
    }
}
