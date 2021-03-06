//
//  FirstScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI
import ViewAdjustSize

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
    @EnvironmentObject var header: HeaderManager
    @EnvironmentObject var router: TransactionInputRouter
    @EnvironmentObject var bottomTab: BottomTabManager
    let circleSize: CGFloat = 82
    @State private var labelPosX: CGFloat = 0
    @State private var tab = 1
    var accounts: [[Account?]] {
        if tab == 0 {
            return FirstScreen.income

        } else {
            return FirstScreen.spending
        }
    }
    var body: some View {
        SlideAnimation2 {
            let spacing: CGFloat = adjust(30)
            VStack(spacing: spacing) {
                // 収入と支出の切り替え
                Picker(selection: $tab, label: Text("")) {
                    Text(L10n.incomes)
                            .customFont(size: 11, spacing: .short, weight: .light)

                            .tag(0)
                    Text(L10n.expenses)
                            .customFont(size: 11, spacing: .short, weight: .light)
                            .tag(1)
                      }
                .pickerStyle(.segmented)
                .padding(10)
                .onAppear {
                    let appearance = UISegmentedControl.appearance()
                    let firstPriorityFont = UIFont(name: "Roboto-Light", size: 11.0)
                    let secondPriorityFontfont = UIFont.boldSystemFont(ofSize: 12)
                    let selectFont = UIFont(name: "NotoSansJP-Medium", size: 11.0)

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

                ForEach(0..<accounts.count, id: \.self) { num in
                    HStack(spacing: adjust(36)) {
                        ForEach(accounts[num], id: \.hashValue) { account in
                            Group {
                                if let account = account {
                                    account.circleButton(selected: account.name == header.getAccount()?.name)
                                        .onButtonTap {
                                            header.setAccount(account)
                                            moveForward(screen: .second, router)
                                        }
                                } else {
                                    Text("")
                                }
                            }
                            .adjustSize(width: 82, height: 82)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .hiddenNavigationBarStyle()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Asset.screenBackColor.color)
        .gesture(DragGesture()
                   .onEnded({ value in
                       if abs(value.translation.width) < 10 {
                           return
                       }
                       if value.translation.width < 0 {
                           moveForward(screen: .second, router)
                           self.labelPosX -= 30
                       } else if value.translation.width > 0 {
                           self.labelPosX += 30
//                           moveBack(to: .first, router)
                       }
                   })
        )
        .onAppear {
            bottomTab.show()
            header.setTitle("勘定科目を選択")
        }
    }
}
