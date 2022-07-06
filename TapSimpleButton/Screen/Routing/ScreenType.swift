//
//  Screen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation

enum ScreenType: Equatable {
    case first(Bool)
    case second
    case third
    case setting
    case list
    
    func isShowFooter() -> Bool {
        switch self {
        case .first, .second, .third:
            return true
        default:
            return false
        }
    }

    func isShowBottomMenu() -> Bool {
        switch self {
        case .first, .setting, .list:
            return true
        default:
            return false
        }
    }
}

