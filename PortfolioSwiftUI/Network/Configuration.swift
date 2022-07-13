//
//  Configuration.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

struct Configuration {
    
    static let shared = Configuration()
    
    let API_HOST: String
    let API_HTTP_PROTOCOL: String
    
    private init() {
        API_HOST = "localhost:8080/api/"
        API_HTTP_PROTOCOL = "http://"
    }
}
