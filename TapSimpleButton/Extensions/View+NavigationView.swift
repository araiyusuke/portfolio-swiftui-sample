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
    public var callBack: (() -> Void)?
    
    func body(content: Content) -> some View {
        
        return ZStack {
                        
            if let leading = leading , let trailing = trailing {
                content
                    .navigationTitle(center)
                    .navigationBarBackButtonHidden(true)
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
                        
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(
                                action: {
                                    if let callBack = self.callBack {
                                        callBack()
                                    }
                                }, label: {
                                    Text(trailing)
                                })
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
    public func customNavigation(leading: String? = nil, center: String, trailing: String? = nil, callBack: (() -> Void)? = nil)  -> some View {
        self.modifier(CustomNavigationModifier(leading: leading, center: center, trailing: trailing, callBack: callBack ))
    }
}
