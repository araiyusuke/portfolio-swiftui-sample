//
//  APIAgentProtocol.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/04.
//

import Foundation
import Combine

protocol APIAgentProtocol {
    func run<T: Mockable>(_ request: URLRequest, mockFile: String?, statusCd: Int?) -> AnyPublisher<T, Error>
}

extension APIAgentProtocol {
    func run<T: Mockable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        self.run(request, mockFile: nil, statusCd: nil)
    }
}
