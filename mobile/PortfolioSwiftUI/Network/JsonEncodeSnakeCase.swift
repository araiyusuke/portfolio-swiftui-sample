//
//  JsonEncodeSnakeCase.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/04.
//

import Foundation

func jsonDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}
