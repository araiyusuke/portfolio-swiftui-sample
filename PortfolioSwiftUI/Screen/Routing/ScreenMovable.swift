//
//  ScreenMovable.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

protocol ScreenMovable: View {
    func moveForward(to : ScreenType, _ router: Router) -> Void
    func moveBack(to : ScreenType, _ router: Router) -> Void
}

extension ScreenMovable {
    
    func moveForward(to: ScreenType, _ router: Router) {
        withAnimation(.easeInOut(duration: 0.3)) {
            router.direction = .forward
            router.screen = to
        }
    }
    
    func moveBack(to: ScreenType, _ router: Router) {
        withAnimation(.easeInOut(duration: 0.3)) {
            router.direction = .back
            router.screen = to
        }
    }
}

protocol ScreenMovable2: View {
    func moveForward(to : TransactionInput, _ router: TransactionInputRouter) -> Void
    func moveBack(to : TransactionInput, _ router: TransactionInputRouter) -> Void
}

extension ScreenMovable2 {
    
    func moveBack(to: TransactionInput, _ router: TransactionInputRouter) {
        withAnimation(.easeInOut(duration: 0.5)) {
            router.direction = .back
            router.screen = to
        }
    }
    func moveForward(to: TransactionInput, _ router: TransactionInputRouter) {
        withAnimation(.easeInOut(duration: 0.5)) {
            router.direction = .forward
            router.screen = to
        }
    }
}
