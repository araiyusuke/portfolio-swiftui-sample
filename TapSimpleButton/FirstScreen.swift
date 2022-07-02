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
    
    var menus : [[Account]] {
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

                
                ForEach(0..<menus.count) { num in
                    
                    HStack(spacing: 36) {
                        
                        ForEach(menus[num], id: \.hashValue) { account in
                            Text(account.title)
                                .backgroundCircle(.white, circleSize, account.borderColor, account.boderSize)
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
    
    static let income = [
        
        [
            Account(title: "雑収入", borderColor: .blue),
            Account(title: "売上", borderColor: .red),
            Account(title: "家事消費", borderColor: .green)
        ],
        [
            Account(title: "", borderColor: .orange),
            Account(title: "", borderColor: .pink),
            Account(title: "", borderColor: Color.red)
        ],
        [
            Account(title: "", borderColor: .blue),
            Account(title: "前回の取引", borderColor: Color.gray, boderSize: 5),
            Account(title: "", borderColor: .gray)
        ]
    ]
    
    static let spending = [
        [
            Account(title: "収入", borderColor: .blue),
            Account(title: "接待交際費", borderColor: .red),
            Account(title: "旅費交通費", borderColor: .green)
        ],
        [
            Account(title: "消耗品", borderColor: .orange),
            Account(title: "通信費", borderColor: .pink),
            Account(title: "会議費", borderColor: Color.red)
        ],
        [
            Account(title: "法定福利費", borderColor: .blue),
            Account(title: "前回の取引", borderColor: Color.gray, boderSize: 5),
            Account(title: "その他", borderColor: .gray)
        ]
    ]
}

