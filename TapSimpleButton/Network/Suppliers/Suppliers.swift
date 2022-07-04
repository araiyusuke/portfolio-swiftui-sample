//
//  User.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine

struct Suppliers: Mockable, Hashable {
    var suppliers: [Supplier]
}

struct Supplier: Mockable, Hashable {
    var id: Int
    var name: String
}

protocol UserProtocol {
    func getUser()
}
struct UserInteractor: UserProtocol {
    func getUser() {
        
    }
}
