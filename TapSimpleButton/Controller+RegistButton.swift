//
//  Controller+RegistButton.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    var regist: some View {
        Text("登録")
            .frame(width: 70, height: 40)
//            .padding(.horizontal, 5)
            .foregroundColor(.white)
            .background(Color.rgb(99, 187, 235))
            .cornerRadius(3)
//
//            .frame(width: 70, height: 40)
//            .background(Color.white)
//        
//            .cornerRadius(3)
//            .frame(width: 70, height: 1)
//            .background(Color.rgb(99, 187, 235))
//            .cornerRadius(5)
        
            .onTapGesture {
                moveForward(to: .second, router)
            }
    }
}

