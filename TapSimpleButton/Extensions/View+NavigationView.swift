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
    public let center: String
    public let trailing: String?
    
    func body(content: Content) -> some View {
        
        Group {
            
            if let leading = leading , let trailing = trailing {
                content
                    .navigationTitle(center)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(trailing: Text(trailing).foregroundColor(.white))
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
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
            } else {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("取引一覧")
            }
        }
    }
}

extension View {
    public func customNavigation(leading: String? = nil, center: String, trailing: String? = nil) -> some View {
        self.modifier(CustomNavigationModifier(leading: leading, center: center, trailing: trailing ))
    }
}
