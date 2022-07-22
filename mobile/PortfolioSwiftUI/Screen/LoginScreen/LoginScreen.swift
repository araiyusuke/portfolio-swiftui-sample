//
//  LoginScreen.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/22.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var bottomTabManager: BottomTabManager
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {

        ZStack {
            Asset.lightBlue.color
            contents
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // ボトムメニューは不要
        .onAppear {
            bottomTabManager.hide()
        }
    }

    var contents: some View {
        GeometryReader { geometry in

            VStack {
                // 画面上セーフエリア分スペースを開ける
                Spacer()
                    .frame(height: geometry.safeAreaInsets.top)

                Spacer()

                Text("SwiftUIポートフォリオ")
                    .customFont(size: 16, spacing: .short, color: .white, weight: .light)
                    .frame(maxWidth: .infinity, maxHeight: adjust(40))

                TextField("メールアドレス", text: $email)
                    .foregroundColor(Asset.inputText.color)
                    .padding(.leading, 10)
                    .frame(width: 290, height: 41)
                    .background(.white)
                    .border(.gray)

                TextField("パスワード", text: $password)
                    .foregroundColor(Asset.inputText.color)
                    .padding(.leading, 10)
                    .frame(width: 290, height: 41)
                    .background(.white)
                    .border(.gray)
                    .adjustPadding(.bottom, 20)

                Spacer()

                Text("ログイン")
                    .customFont(size: 16, spacing: .short, color: .white, weight: .light)
                    .onButtonTap {
                        router.screen = .transactionInput
                    }

                // 画面下セーフエリア分スペースを開ける
                Spacer()
                    .frame(height: geometry.safeAreaInsets.bottom)

            }
            .frame(maxHeight: .infinity)
            // セーフエリアを無視する
            .ignoresSafeArea()
            .background(Asset.lightBlue.color)
        }

    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
