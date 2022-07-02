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
                
            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.gray)
            
            VStack {
                Text("取引入力")

            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(Color.white)

            VStack {
                Text("レシート撮影")

            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.yellow)

            VStack {
                Text("ヘルプ")
            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.pink)

            VStack {
                Text("その他")

            }
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
            .background(Color.blue)


        }
        .font(.caption2)
        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .bottom)
        .foregroundColor(Color.fontColor)

    }
//        .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .top)
//        .background(Color.backGroundColor)
//        .edgesIgnoringSafeArea(edges: [.top])
    
}
