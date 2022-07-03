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
    
    func color(_ flag: Bool) -> Color {
        return flag ? Color.blue: Color.rgb(127, 127, 127)
    }
    
    var bottomMenu: some View {
        
        HStack(spacing: 0) {
            
            ForEach(Self.menus) { menu in
                
                VStack {

                    menu.image.foregroundColor(color(self.selectTabMenu == menu))

                    Text(menu.description)
                        .customFont(size: 11, spacing: .short, rgb: color(self.selectTabMenu == menu), weight: .light)

                }
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
                .onButtonTap {
                    selectTabMenu = menu
                }
            }
        }.padding(.horizontal, 10)
    }
}
