//
//  User.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/04.
//

import Foundation
import Combine

struct Supplier: Mockable, Hashable {
    var suppliers: [PullDownItem]
}

struct PullDownItem: Mockable, Hashable, Identifiable {
    var id: Int
    var name: String
    public func getName() -> String {
        return self.name
    }
}

protocol Hogetarou: Identifiable, Hashable {
    func getName() -> String
}

protocol UserProtocol {
    func getUser()
}
struct UserInteractor: UserProtocol {
    func getUser() {}
}
