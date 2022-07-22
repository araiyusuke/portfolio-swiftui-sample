//
//  LoginScreen.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/22.
//

import SwiftUI
import Combine

struct LoginScreen: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var bottomTabManager: BottomTabManager
    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            Asset.lightBlue.color
            switch viewModel.fetchTokenResult {
            case .notRequested:
                contents
            case .isLoading:
                ZStack {
                    LoadingView()
                    contents
                }
            case .loaded:
                Text("テストさん、ログインに成功しました")
                    .customFont(size: 16, spacing: .short, color: .lightGray, weight: .light)
                    .padding(30)
                    .background(.white)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            router.screen = .transactionInput
                        }
                    }
            case let .failed(error):
                failedView(error)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // ボトムメニューは不要
        .onAppear {
            bottomTabManager.hide()
        }
    }

    func failedView(_ error: Error) -> some View {
        Text(error.localizedDescription)
            .customFont(size: 16, spacing: .short, color: .white, weight: .light)

    }

    var loadingView: some View {
        Text("loading")
            .customFont(size: 16, spacing: .short, color: .white, weight: .light)
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

                TextField("メールアドレス", text: $viewModel.email)
                    .foregroundColor(Asset.inputText.color)
                    .padding(.leading, 10)
                    .frame(width: 290, height: 41)
                    .background(.white)
                    .border(.gray)

                TextField("パスワード", text: $viewModel.password)
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
                        viewModel.login()
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

struct LoadingView: View {

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.6)
            ProgressView("")
        }
        .zIndex(.infinity)
    }
}
