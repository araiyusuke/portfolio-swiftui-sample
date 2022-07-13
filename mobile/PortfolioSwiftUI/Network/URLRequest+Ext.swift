//
//  URLRequest+Ext.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

extension URLRequest {

    mutating func setToken(token: String) {
        self.allHTTPHeaderFields = ["Authorization": "Bearer \(token)"]
    }
    mutating func setMethod(method: HTTPRequestMethod) {
        self.httpMethod = method.description
    }
    mutating func setJsonHeader() {
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    mutating func setBody(_ params: RequestParameter) {
        self.httpBody = params.data
    }
    static func create(_ endPoint: EndPoint, method: HTTPRequestMethod, token: Token? = nil) -> Self {
        var request = URLRequest.init(url: endPoint.url)
        request.setJsonHeader()
        request.setMethod(method: method)
        if let token = token?.plainText {
            request.setToken(token: token)
        }
        return request
    }
    static func create(_ endPoint: EndPoint, method: HTTPRequestMethod,
                       token: Token? = nil, parameter: RequestParameter?) -> Self {
        var request = URLRequest.init(url: endPoint.url)
        request.setJsonHeader()
        request.setMethod(method: method)
        if let parameter = parameter {
            request.setBody(parameter)
        }

        if let token = token?.plainText {
            request.setToken(token: token)
        }
        return request
    }
}
