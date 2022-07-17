//
//  Router.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

class Header: ObservableObject {
    @Published private (set) var isShowToast: Bool  = false
    @Published var title: String  = ""
    @Published private (set) var toastTitle: String  = ""
    @Published private var account: Account?
    @Published private var numPadValue: String  = ""
    public func showToast(title: String) {
        isShowToast.toggle()
        toastTitle = title
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isShowToast.toggle()
            self.toastTitle = ""
        }
    }
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
        let number = Int(self.numPadValue) ?? 0
        return number.money
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
