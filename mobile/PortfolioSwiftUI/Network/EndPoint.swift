//
//  EndPoint.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/04.
//

import Foundation

struct EndPoint {
    let url: URL
    init(url: String) {
        self.url = URL(string: url)!
    }
}
