//
//  View+NavigationView.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/10.
//

import Foundation
import SwiftUI

struct NavigationModifier: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    let title: String
    
    func body(content: Content) -> some View {
        content
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: Text("上書き保存").foregroundColor(.white))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(
                    action: {
                        dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "arrow.backward")
                            Text("キャンセル")
                        }
                    }
                ).tint(.white)
            }
        }
    }
}


extension View {
    public func navigationForUpdateTransaction(title: String) -> some View {
        self.modifier(NavigationModifier(title: title))
    }
}
