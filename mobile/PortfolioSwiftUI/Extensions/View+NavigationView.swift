//
//  View+NavigationView.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/10.
//

import Foundation
import SwiftUI

struct CustomNavigationModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    public let leading: String?
    // 必ずセットされる
    public let center: String
    public let trailing: String?
    public var callBack: (() -> Void)?

    func body(content: Content) -> some View {
        ZStack {
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(center)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if let leading = leading {
                            Button(
                                action: {
                                    dismiss()
                                }, label: {
                                    HStack {
                                        Image(systemName: "arrow.backward")
                                        Text(leading)
                                    }
                                }
                            ).tint(.white)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                if let callBack = self.callBack {
                                    callBack()
                                }
                            }, label: {
                                if let trailing = trailing {
                                    Text(trailing)
                                }
                            })
                    }
                }
        }
        .accentColor(.white)
    }
}

extension View {
    /// Navigationに文字列を表示(左、真ん中、右(タップしたらコールバックが返されれる)
    public func customNavigation
    (
        leading: String? = nil,
        center: String,
        trailing: String? = nil,
        callBack: (() -> Void)? = nil
    )  -> some View {
        self.modifier(CustomNavigationModifier(
            leading: leading,
            center: center,
            trailing: trailing,
            callBack: callBack
        ))
    }
}
