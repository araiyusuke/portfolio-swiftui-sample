//
//  APIError.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
enum TokenErrorType {
    case device
    case member
}

enum APIError: Error {
    case invalidResponse
    case wifiError
    case serverError
    case timeout
    case tooManyRequest
    case validation(data: ResponseResultError)
    case networkError(error: Error)
    case jsonDecodeError
    case unauthorized(TokenErrorType)
    case serverErrorMessage(code: Int, data: ResponseResultError)
    case clientError(code: Int, data: URLSession.DataTaskPublisher.Output)
}
