//
//  RequestParameter.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

protocol RequestParameter: Codable {}

extension RequestParameter {
    var data: Data! {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(self)
    }
}
