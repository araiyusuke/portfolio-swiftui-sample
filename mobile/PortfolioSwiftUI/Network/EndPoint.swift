//
//  EndPoint.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

struct EndPoint {
    let url: URL
    init(url: String) {
        self.url = URL(string: url)!
    }
}
