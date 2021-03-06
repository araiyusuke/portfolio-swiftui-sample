//
//  ResponseResultError.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/04.
//

import Foundation

struct ResponseResultError: Codable {
    let code: Int
    let message: String
    let errors: [FieldError]?
    var messages: [String]? {
        if let errors = errors {
            return errors.map({ (student) -> String in
                 student.message
            })
        } else {
            return nil
        }
    }
}

struct FieldError: Codable {

    let field: String
    let message: String

    var description: String {
        return "\(message)"
    }
}
