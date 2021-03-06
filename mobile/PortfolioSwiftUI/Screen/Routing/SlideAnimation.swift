//
//  SlideAnimation.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/02.
//

import Foundation
import SwiftUI

struct SlideAnimation<Content: View>: ScreenMovable {
    @EnvironmentObject var action: Router
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        content
            .setTransAnimation(direction: action.direction)
    }
}

struct SlideAnimation2<Content: View>: ScreenMovable2 {
    @EnvironmentObject var action: TransactionInputRouter
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        content
            .setTransAnimation(direction: action.direction)
    }
}
