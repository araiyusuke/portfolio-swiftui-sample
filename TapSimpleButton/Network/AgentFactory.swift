//
//  AgentFactory.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

struct AgentFactory {
    
    static func create(config: URLSessionConfiguration? = nil) -> APIAgentProtocol {
        #if NotServer
        return APIMockAgent(config: config)
        #else
        return APIAgent(config: config)
        #endif
    }
    
    static func stub(statusCd: Int, json: String) -> URLSessionConfiguration {
        StubURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!, statusCode: statusCd, httpVersion: "HTTP/2", headerFields: [:])!
            let data = loadFile(json: json)
            return (response, data)
        }

        let config = URLSessionConfiguration.default
        config.protocolClasses = [StubURLProtocol.self]
        return config
    }
}

func loadFile(json: String)-> Data  {
    let path = Bundle.main.path(forResource: json, ofType: "json")!
    let url = URL(fileURLWithPath: path)
    return try! Data(contentsOf: url)
}
