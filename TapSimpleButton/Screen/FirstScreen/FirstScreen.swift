//
//  FirstScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension FirstScreen {
    
    class ViewModel: ObservableObject {
        
        let container: DIContainer

        init(container: DIContainer) {
            self.container = container
        }
    }
}

struct FirstScreen: ScreenMovable2 {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    @EnvironmentObject var header : Header
    @EnvironmentObject var router : TransactionInputRouter

    let circleSize: CGFloat = 82
    @State private var labelPosX:CGFloat = 0
    @State private var tab = 1
    let registed: Bool
    
    var menus : [[Account?]] {
        if tab == 0 {
            return FirstScreen.income

        } else {
            return FirstScreen.spending
        }
    }
    
    var body: some View {
        
        SlideAnimation2 {
            
            let spacing:CGFloat = 30
            
            VStack(spacing: spacing) {

                Picker(selection: $tab, label: Text("")) {
                          Text("収入")
                            .customFont(size: 11, spacing: .short, color: .dark, weight: .light)

                            .tag(0)
                          Text("支出")
                            .customFont(size: 11, spacing: .short, color: .dark, weight: .light)
                            .tag(1)
                      }
                .pickerStyle(.segmented)
                .padding(10)
                .onAppear() {
                    
                    let appearance = UISegmentedControl.appearance()
                    let firstPriorityFont = UIFont(name: "Roboto-Light", size: 11.0);
                    let secondPriorityFontfont = UIFont.boldSystemFont(ofSize: 12)
                    let selectFont = UIFont(name: "NotoSansJP-Medium", size: 11.0);

                       let foregroundColor = UIColor.black

                       // 選択時の背景色
                    appearance.selectedSegmentTintColor = UIColor.white

                       // 通常時のフォントとフォント色
                       appearance.setTitleTextAttributes([
                           .font: firstPriorityFont ?? secondPriorityFontfont,
                           .foregroundColor: foregroundColor
                       ], for: .normal)

                       // 選択時のフォントとフォント色
                       appearance.setTitleTextAttributes([
                            .font: selectFont ?? secondPriorityFontfont,
                           .foregroundColor: UIColor.black
                       ], for: .selected)
                }

                ForEach(0..<menus.count, id: \.self) { num in
                    
                    HStack(spacing: 36) {
                        
                        ForEach(menus[num], id: \.hashValue) { account in
                            
                            Group {
                                
                                if let account = account {
                                    
                                    account.view(selected: account.title == header.getAccount()?.title).onButtonTap() {
                                        header.setAccount(account)
                                        moveForward(to: .second, router)
                                    }
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
//                           moveBack(to: .first, router)

                       }
                   })
        )
        .onAppear() {
            header.setTitle("勘定科目を選択")
        }
    }
}
