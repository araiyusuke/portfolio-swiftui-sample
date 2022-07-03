//
//  SecondScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

struct SecondScreen: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var info : HeaderInfo

    @State private var labelPosX:CGFloat = 0
    @State var torihiki = ""
    @State var editText = ""

    var body: some View {
        SlideAnimation {
            VStack(spacing: 15) {
                Text("取引先")
                    .customFont(size: 12, spacing: .short, color: .dark, weight: .light)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 5) {
                    TextField("取引先を入力(任意)", text: $torihiki)
                        .frame(width: 290, height: 41)
                        .padding(.leading, 5)
                        .background(.white)
                        .border(.gray)
                    
                    Text("↓")
                        .foregroundColor(.white)
                        .frame(width: 41, height: 41)
                        .background(Color.headerColor)
                        .cornerRadius(7)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text("摘要")
                    .customFont(size: 12, spacing: .short, color: .dark, weight: .light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .top, spacing: 5) {
                    
                    TextEditor(text: $editText)
                        .frame(width: 290, height: 100)
                        .padding(.leading, 5)
                        .background(.white)
                        .border(.gray)
                        
                    Text("↓")
                        .foregroundColor(.white)
                        .frame(width: 41, height: 41)
                        .background(Color.headerColor)
                        .cornerRadius(7)

                }

                
                Text("取引の内容やメモを入力します。\n入力すると、後で取引を探しやすくなります。\n入力しなくても構いません。")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            .padding(.leading, 34)
            .padding(.top, 10)

            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .foregroundColor(Color.fontColor)
            .font(.footnote)
            .background(Color.backGroundColor)
            .gesture(DragGesture()
                       .onEnded({ value in
                           
                           if (abs(value.translation.width) < 10) {
                               return
                           }
                           
                           if (value.translation.width < 0 ) {
                               moveForward(to: .third, router)

                               self.labelPosX -= 30
                           } else if (value.translation.width > 0 ) {
                               self.labelPosX += 30
                               moveBack(to: .first, router)

                           }
                       })
                   )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear() {
            info.title = "取引先・適用入力"
        }
    }
}
