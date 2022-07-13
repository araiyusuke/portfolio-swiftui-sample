//
//  Controller+BottomMenu.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    static let menus: [BottomMenuType] = [
        .list,
        .input,
        .camera,
        .help,
        .etc,
    ]
    
    func rgb(_ flag: Bool) -> Color {
        return flag ? Color.blue: Color.rgb(127, 127, 127)
    }
    
    var bottomMenu: some View {
        
        HStack(spacing: 0) {
            
            ForEach(Self.menus) { menu in
                
                VStack {

                    menu.image.foregroundColor(rgb(self.selectTabMenu == menu))

                    Text(menu.description)
                        .customFont(size: 11, spacing: .short, rgb: rgb(self.selectTabMenu == menu), weight: .light)

                }
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
                .onButtonTap {
                    
                    if selectTabMenu == menu {
                        return
                    }
                    
                    selectTabMenu = menu
                    
                    switch(selectTabMenu) {
                    case .list:
                        moveForward(to: .transactionList, router)
                    case .input:
                        moveForward(to: .transactionInput(false), router)
                    case .camera:
                        moveForward(to: .receipt, router)
                    case .help:
                        moveForward(to: .help, router)
                    case .etc:
                        moveForward(to: .setting, router)
                    }
                
                }
            }
        }
        .padding(.horizontal, 10)
        .background(Color.white)
    }
}
