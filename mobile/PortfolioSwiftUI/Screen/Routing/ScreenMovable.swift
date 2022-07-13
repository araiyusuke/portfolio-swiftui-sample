//
//  ScreenMovable.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

protocol ScreenMovable: View {
    func moveForward(screen: ScreenType, _ router: Router)
    func moveBack(screen: ScreenType, _ router: Router)
}

extension ScreenMovable {
    func moveForward(screen: ScreenType, _ router: Router) {
        withAnimation(.easeInOut(duration: 0.3)) {
            router.direction = .forward
            router.screen = screen
        }
    }
    func moveBack(screen: ScreenType, _ router: Router) {
        withAnimation(.easeInOut(duration: 0.3)) {
            router.direction = .back
            router.screen = screen
        }
    }
}

protocol ScreenMovable2: View {
    func moveForward(screen: TransactionInput, _ router: TransactionInputRouter)
    func moveBack(screen: TransactionInput, _ router: TransactionInputRouter)
}

extension ScreenMovable2 {
    func moveBack(screen: TransactionInput, _ router: TransactionInputRouter) {
        withAnimation(.easeInOut(duration: 0.5)) {
            router.direction = .back
            router.screen = screen
        }
    }
    func moveForward(screen: TransactionInput, _ router: TransactionInputRouter) {
        withAnimation(.easeInOut(duration: 0.5)) {
            router.direction = .forward
            router.screen = screen
        }
    }
}
