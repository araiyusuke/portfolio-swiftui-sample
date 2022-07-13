//
//  Router.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

enum Direction {
    case forward, back
}

class TransactionInputRouter: ObservableObject {
    
    // スタート画面は取引入力
    @Published var screen: TransactionInput = .first
    @Published var direction: Direction = .forward
    
    private init() {}
    
    static let shared: TransactionInputRouter = .init()
}

class BottomTabManager: ObservableObject {
    @Published var isShow: Bool = true
    private init() {}

    static let shared: BottomTabManager = .init()

}

class Router: ObservableObject {
    
    enum TransactionListScreenType {
        case top
        case detail
    }
    
    // スタート画面は取引入力
    @Published var screen: ScreenType = .transactionInput(false)
    @Published var direction: Direction = .forward

    public init() {}
    
    static let shared: Router = .init()
    
}