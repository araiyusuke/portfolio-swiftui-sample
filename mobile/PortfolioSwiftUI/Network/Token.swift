//
//  Token.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine
import SwiftUI

struct APIToken: Codable {
}

enum TokenError: Error {
    case nilValue
}

protocol Token: Codable {
    init()
    var plainText: String? { get set}
}

extension Token {
    init(plainText: String?) throws {
        if plainText == nil {
            throw TokenError.nilValue
        }
        self.init()
        self.plainText = plainText
    }
}

struct DeviceToken: Token {
    var plainText: String?
}

struct MemberToken: Token, CustomStringConvertible {
    var plainText: String?
    var description: String {
        return """
        \(plainText ?? "nil")
        """
    }
}
