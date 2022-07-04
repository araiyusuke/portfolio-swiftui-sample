//
//  DescriptionsAPI.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine

enum DescriptionsAPI {
    
    struct Response: Mockable {
        let descriptions: [Description]
    }
    
    private static let agent = AgentFactory.create()

    static func fetch() -> AnyPublisher<Response, Error> {
        return agent.run(
            API
                .Descriptions
                .Fetch
                .request()
        )
    }
}
