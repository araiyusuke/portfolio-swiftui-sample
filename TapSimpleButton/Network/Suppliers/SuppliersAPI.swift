//
//  UsersAPI.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine

enum SuppliersAPI {
    
    struct Response: Mockable {
        let suppliers: [Supplier]
    }
    
    private static let agent = AgentFactory.create()

    static func fetch() -> AnyPublisher<Response, Error> {
        return agent.run(
            API
                .Sppliers
                .Fetch
                .request()
        )
    }
}
