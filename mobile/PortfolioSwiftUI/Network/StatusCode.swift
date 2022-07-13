//
//  StatusCode.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

enum StatusCode: Error {
    static let httpSuccess: Int = 200
    static let httpUnauthorized401: Int = 401
    static let httpClientErrorRange = 400...499
    static let httpNotFoundAndNotAllowed = 404...405
    static let httpTooManyRequest429 = 429
    static let unProcessableEntity422 = 422
    case server(Int)
    case sessionFailed(error: Error)
    case decode(Error)
    case noResponse
    case unknown(Error)
}
