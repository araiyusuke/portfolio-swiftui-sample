//
//  Controller+BottomMenu.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    var bottomMenu: some View {
        
        HStack(spacing: 0) {
            VStack {
                Text("取引一覧")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)

            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.gray)
            
            VStack {
                Text("取引入力")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)

            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(Color.white)

            VStack {
                Text("レシート撮影")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)

            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.yellow)

            VStack {
                Text("ヘルプ")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)

            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.pink)

            VStack {
                Text("その他")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)


            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.blue)


        }
        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)

    }

//        .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .top)
//        .background(Color.backGroundColor)
//        .edgesIgnoringSafeArea(edges: [.top])
    
}
