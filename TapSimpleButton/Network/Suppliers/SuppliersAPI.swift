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
        
        let suppliers: [PullDownItem]
        
        static func mock(_ file: String? = nil) -> Response {
            let decoder = jsonDecoder()
            return try! decoder.decode(Response.self, from: loadFile(json: file ?? "Success_Fetch_Suppliers"))
        }
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
