//
//  Router.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

class HeaderInfo: ObservableObject {
    @Published var title: String  = ""
    @Published var account: Account? = nil
    @Published var numPadValue: String  = ""
}
