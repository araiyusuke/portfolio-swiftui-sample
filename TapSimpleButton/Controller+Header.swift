//
//  Controller+Header.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    var header: some View {
        
        Group {
            
            switch router.screen {
            case .first:
                VStack() {
                    
                    Text("白色申告")
                        .customFont(size: 30, spacing: .short, color: .light, weight: .light)
                        .frame(height: 30)
                    
                    Text(info.title)
                        .customFont(size: 14, spacing: .short, color: .light, weight: .bold)
                        .frame(height: 30)
                }
                .frame(maxHeight: .infinity, alignment: .center)


            case .second:
                VStack {
                    Text("雑費")
                        .customFont(size: 14, spacing: .short, color: .light, weight: .bold)
                        .frame(height: 20)

                    Text("取引先・提要入力")
                        .customFont(size: 14, spacing: .short, color: .light, weight: .bold)

                        .frame(height: 30)
                }
                .frame(alignment: .top)


            case .third:
                VStack(spacing: 0) {
                    Text("雑費")
                        .customFont(size: 14, spacing: .short, color: .light, weight: .bold)
                        .frame(height: 20)

                    Text("2022/07/02")
                        .customFont(size: 19, spacing: .short, rgb: Color.rgb(242,220, 171), weight: .bold)
                        .frame(height: 30)

                    Text("¥0")
                        .customFont(size: 24, rgb: Color.rgb(242,220, 171), weight: .bold)
                        .frame(height: 30)
                }
                .frame(alignment: .top)

            }
        }
        .foregroundColor(.white)
    }
}
