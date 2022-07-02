//
//  FirstScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

struct FirstScreen: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var info : HeaderInfo

    let circleSize: CGFloat = 82
    @State private var labelPosX:CGFloat = 0
    @State private var tab = 0
    
    var menus : [[Account?]] {
        if tab == 0
        {
            return FirstScreen.income

        } else {
            return FirstScreen.spending

        }
    }
    
    var body: some View {
        
        SlideAnimation {
            
            let spacing:CGFloat = 30
            
            VStack(spacing: spacing) {

                Picker(selection: $tab, label: Text("")) {
                          Text("収入")
                            .foregroundColor(.black)
                            .tag(0)
                          Text("支出")
                            .foregroundColor(.black)
                            .tag(1)
                      }
                .pickerStyle(.segmented)
                .padding(10)
                .onAppear() {
                    let appearance = UISegmentedControl.appearance()
                       let font = UIFont.boldSystemFont(ofSize: 12)
                       let foregroundColor = UIColor.black

                       // 選択時の背景色
                    appearance.selectedSegmentTintColor = UIColor.white

                       // 通常時のフォントとフォント色
                       appearance.setTitleTextAttributes([
                           .font: font,
                           .foregroundColor: foregroundColor
                       ], for: .normal)

                       // 選択時のフォントとフォント色
                       appearance.setTitleTextAttributes([
                           .font: font,
                           .foregroundColor: UIColor.black
                       ], for: .selected)
                }

                ForEach(0..<menus.count, id: \.self) { num in
                    
                    HStack(spacing: 36) {
                        
                        ForEach(menus[num], id: \.hashValue) { account in
                            Group {
                                if let account = account {
                                    account.view
                                } else {
                                    Text("")
                                }
                            }
                            .frame(width: 82, height: 82)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .font(.footnote)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.backGroundColor)
        .gesture(DragGesture()
                   .onEnded({ value in
                       
                       if (abs(value.translation.width) < 10) {
                           return
                       }
                       
                       if (value.translation.width < 0 ) {
                           moveForward(to: .second, router)

                           self.labelPosX -= 30
                       } else if (value.translation.width > 0 ) {
                           self.labelPosX += 30
                           moveBack(to: .first, router)

                       }
                   })
        ).onAppear() {
            info.title = "勘定科目を選択"
        }
    }
}
