//
//  ApiEndPoint.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

struct API {

    static let PROTOCOL = URL(string: Configuration.shared.apiHttpProtcol)!
    static let HOST = URL(string: Configuration.shared.apiHost)!
    static let SPPLIER = "suppliers"
    static let DESCRIPTION = "descriptions"
    static let TRANSACTION = "transactions"

    static let sppliterEndPoint = "\(API.PROTOCOL)\(API.HOST)\(SPPLIER)"
    static let descriptionsEndPoint = "\(API.PROTOCOL)\(API.HOST)\(DESCRIPTION)"
    static let transactionsEndPoint = "\(API.PROTOCOL)\(API.HOST)\(TRANSACTION)"

    struct Transactions {
        struct Fetch: RequestParameter {
            static let endPoint = EndPoint(url: "\(API.transactionsEndPoint)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
        struct Regist: RequestParameter {
            static let endPoint = EndPoint(url: "\(API.transactionsEndPoint)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .post)
            }
        }
        struct Update: RequestParameter {
            static let endPoint = EndPoint(url: "\(API.transactionsEndPoint)/update")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .post)
            }
        }
    }

    struct Descriptions {
        static let endPoint = EndPoint(url: "\(API.descriptionsEndPoint)/")
        struct Fetch: RequestParameter {
            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
    }

    struct Sppliers {
        struct Fetch: RequestParameter {
            static let endPoint = EndPoint(url: "\(API.sppliterEndPoint)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
        struct Create: RequestParameter {
            static let endPoint = EndPoint(url: "\(API.sppliterEndPoint)/")

            static func request() -> URLRequest {
                return URLRequest.create(endPoint, method: .get)
            }
        }
    }
}
