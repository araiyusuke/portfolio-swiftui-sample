//
//  Description.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/04.
//

import Foundation
import Combine

struct Descriptions: Mockable, Hashable {
    var descriptions: [Description]
}

struct Description: Mockable, Hashable {
    var id: Int
    var name: String
    func getName() -> String {
        return name
    }
}
