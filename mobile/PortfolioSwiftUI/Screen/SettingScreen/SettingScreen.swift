//
//  SettingScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import SwiftUI

struct SettingScreen: ScreenMovable {
    @EnvironmentObject var router: Router
    @State var selected = 0
    var body: some View {
        Form {
            Section {
                Picker(selection: $selected, label: Text("\(L10n.account)\(L10n.settings)")) {
                }
                Picker(selection: $selected, label: Text("取引の入力制限の確認")) {
                }
                HStack {
                    Text("バージョン")
                    Spacer()
                    Text("2.5.0")
                }
            }
            Section {
                Text(L10n.logout)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(L10n.others)
    }
}
