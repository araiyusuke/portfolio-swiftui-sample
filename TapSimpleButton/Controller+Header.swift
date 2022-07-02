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
                        .font(.title)
                        .frame(height: 30)
                    
                    Text(info.title)
                        .frame(height: 30)
                }
                .frame(maxHeight: .infinity, alignment: .center)


            case .second:
                VStack {
                    Text("雑費")
                        .frame(height: 20)

                    Text("取引先・提要入力")
                        .frame(height: 30)
                }
                .frame(alignment: .top)


            case .third:
                VStack {
                    Text("雑費")
                        .frame(height: 20)

                    Text("2022/07/02")
                        .frame(height: 30)
                        .foregroundColor(Color.rgb(242,220, 171))


                    Text("¥0")
                        .frame(height: 20)
                        .foregroundColor(Color.rgb(242,220, 171))
                }
                .frame(alignment: .top)

            }
        }
        .foregroundColor(.white)
    }
}
