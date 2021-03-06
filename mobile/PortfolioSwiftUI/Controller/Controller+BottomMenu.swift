//
//  Controller+BottomMenu.swift
//  TapSimpleButton
//
//  Created by ććăȘă on 2022/07/02.
//

import Foundation
import SwiftUI
import ViewAdjustSize
extension Controller {
    static let menus: [BottomMenuType] = [
        .list,
        .input,
        .camera,
        .help,
        .etc
    ]
    func rgb(_ flag: Bool) -> Color {
        return flag ? Asset.lightBlue.color: Asset.lightGray.color
    }
    var bottomMenu: some View {
        HStack(spacing: 0) {
            ForEach(Self.menus) { menu in
                VStack {
                    menu.image.foregroundColor(rgb(self.selectTabMenu == menu))
                    Text(menu.description)
                        .customFont(size: adjust(11), spacing: .none, rgb: rgb(self.selectTabMenu == menu), weight: .light)

                }
                .frame(maxWidth: .infinity, maxHeight: adjust(60), alignment: .bottom)
                .onButtonTap {
                    if selectTabMenu == menu {
                        return
                    }
                    selectTabMenu = menu
                    switch selectTabMenu {
                    case .list:
                        moveForward(screen: .transactionList, router)
                    case .input:
                        moveForward(screen: .transactionInput(false), router)
                    case .camera:
                        moveForward(screen: .receipt, router)
                    case .help:
                        moveForward(screen: .help, router)
                    case .etc:
                        moveForward(screen: .setting, router)
                    }
                }
            }
        }
        .adjustPadding(.horizontal, 10)
        .background(Asset.bottomMenuBack.color)
        .border(width: 1, edges: [.top], color: Asset.lightGray.color)
    }
}
