//
//  Mockable.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

protocol Mockable: Decodable {
    static func mock(_ file: String?) -> Self
}

extension Mockable {
    static func mock(_ file: String? = nil) -> Self {
        self.mock(file)
    }
}
