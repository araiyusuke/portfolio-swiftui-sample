//
//  Screen.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/02.
//

import Foundation

enum TransactionInput: Equatable {
    case first, second, third
}

enum ScreenType: Equatable {
    case transactionInput(Bool)
    case receipt
    case setting
    case help
    case transactionList
    func isShowFooter() -> Bool {
        switch self {
        case .transactionInput:
            return true
        default:
            return false
        }
    }
    func isShowBottomMenu() -> Bool {
        return true
//        switch self {
//        case .transactionInput, .setting, .transactionList:
//            return true
//        default:
//            return false
//        }
    }
}
