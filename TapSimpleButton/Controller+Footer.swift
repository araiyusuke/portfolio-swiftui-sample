//
//  FirstScreen+Footer.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {

    var footer : some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {
                
                back
                    .padding(.leading, 5)
                    .frame(width: geometry.size.width * 0.2, alignment: .leading)
                
                navi
                    .frame(width: 170, height: 45)
                    .frame(width: geometry.size.width * 0.6, height: 60)
                
                nextOrRegist.padding(.trailing, 5)
                    .frame(width: geometry.size.width * 0.2, alignment: .trailing)

            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .trailing)
            
        }
    }
}
