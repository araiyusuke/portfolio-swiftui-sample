//
//  Configuration.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

struct Configuration {
    static let shared = Configuration()
    let apiHost: String
    let apiHttpProtcol: String
    private init() {
        apiHost = "localhost:8080/api/"
        apiHttpProtcol = "http://"
    }
}
