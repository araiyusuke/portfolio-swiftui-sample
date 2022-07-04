//
//  ApiEndPoint.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

struct API {

    static let PROTOCOL = URL(string: Configuration.shared.API_HTTP_PROTOCOL)!
    static let HOST = URL(string: Configuration.shared.API_HOST)!
    static let SPPLIER = "suppliers"
    static let DESCRIPTION = "descriptions"
    static let TRANSACTION = "transactions"

    static let SPPLIER_END_POINT = "\(API.PROTOCOL)\(API.HOST)\(SPPLIER)"
    static let DESCRIPTIONS_END_POINT = "\(API.PROTOCOL)\(API.HOST)\(DESCRIPTION)"
    static let TRANSACTIONS_END_POINT = "\(API.PROTOCOL)\(API.HOST)\(TRANSACTION)"

    struct Transactions {
        struct Fetch: RequestParameter {

            static let endPoint = EndPoint(url:"\(API.TRANSACTIONS_END_POINT)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
    }
    
    struct Descriptions {
        struct Fetch: RequestParameter {

            static let endPoint = EndPoint(url:"\(API.DESCRIPTIONS_END_POINT)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
    }
    
    struct Sppliers {

        struct Fetch: RequestParameter {

            static let endPoint = EndPoint(url:"\(API.SPPLIER_END_POINT)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
        
        struct Create: RequestParameter {

            static let endPoint = EndPoint(url:"\(API.SPPLIER_END_POINT)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
    }
}
