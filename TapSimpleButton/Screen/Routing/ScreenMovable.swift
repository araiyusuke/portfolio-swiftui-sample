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
