//
//  JsonEncodeSnakeCase.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

func jsonDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}
