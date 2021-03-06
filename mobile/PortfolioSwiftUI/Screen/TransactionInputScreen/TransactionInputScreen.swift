//
//  TransactionInputScreen.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/07.
//

import SwiftUI

struct TransactionInputScreen: ScreenMovable2 {
    @EnvironmentObject var router: TransactionInputRouter
    @EnvironmentObject var header: HeaderManager
    @ObservedObject private(set) var viewModel: ViewModel
    let container: DIContainer
    init(container: DIContainer) {
        self.container = container
        self.viewModel = .init(container: container)
    }
    var contents: some View {
        return ZStack {
            switch router.screen {
            case .first:
                FirstScreen(viewModel: FirstScreen.ViewModel(container: container))
            case .second:
                SecondScreen()
            case .third:
                ThirdScreen()
            }
        }
    }
    var body: some View {
        VStack(spacing: 0) {
            contents
            footer
                .adjustSize(height: 60)
                .background(Asset.screenBackColor.color)
        }
        .background(Asset.screenBackColor.color)
    }
}
