//
//  Router.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

class Header: ObservableObject {
    
    @Published private var title: String  = ""
    @Published private var account: Account? = nil
    @Published private var numPadValue: String  = ""
    
    public func setAccount(_ account: Account) {
        self.account = account
    }
    
    public func getAccount() -> Account? {
        return self.account
    }
    
    public func setTitle( _ title: String) {
        self.title = title
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getNumPad() -> String {
        return self.numPadValue
    }
    
    public func removeLast() {
        self.numPadValue.removeLast()
    }
    
    public func append(letter: String) {
        self.numPadValue.append(letter)
    }
    
    public func setNumPad(value: String) {
        self.numPadValue = value
    }
}
