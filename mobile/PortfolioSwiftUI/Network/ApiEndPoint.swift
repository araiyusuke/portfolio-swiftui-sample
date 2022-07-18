//
//  ApiEndPoint.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation

struct Api {

    static let httpProtocol = URL(string: Configuration.shared.apiHttpProtcol)!
    static let host = URL(string: Configuration.shared.apiHost)!
    static let suppliers = "suppliers"
    static let descriptions = "descriptions"
    static let transactions = "transactions"

    static let sppliterEndPoint = "\(Api.httpProtocol)\(Api.host)\(suppliers)"
    static let descriptionsEndPoint = "\(Api.httpProtocol)\(Api.host)\(descriptions)"
    static let transactionsEndPoint = "\(Api.httpProtocol)\(Api.host)\(transactions)"
}

struct TransactionsApi {
    struct Fetch: RequestParameter {
        static let endPoint = EndPoint(url: "\(Api.transactionsEndPoint)/")

        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .get)
        }
    }
    struct Regist: RequestParameter {
        static let endPoint = EndPoint(url: "\(Api.transactionsEndPoint)/")

        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .post)
        }
    }
    struct Delete: RequestParameter {
        static let endPoint = EndPoint(url: "\(Api.transactionsEndPoint)/")

        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .post)
        }
    }
    struct Update: RequestParameter {
        static let endPoint = EndPoint(url: "\(Api.transactionsEndPoint)/update")

        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .post)
        }
    }
}

struct DescriptionsApi {
    static let endPoint = EndPoint(url: "\(Api.descriptionsEndPoint)/")
    struct Fetch: RequestParameter {
        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .get)
        }
    }
}

struct SuppliersApi {
    struct Fetch: RequestParameter {
        static let endPoint = EndPoint(url: "\(Api.sppliterEndPoint)/")

        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .get)
        }
    }
    struct Create: RequestParameter {
        static let endPoint = EndPoint(url: "\(Api.sppliterEndPoint)/")

        static func request() -> URLRequest {
            return URLRequest.create(endPoint, method: .get)
        }
    }
}
