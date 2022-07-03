//
//  ThirdScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

struct ThirdScreen: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var info : HeaderInfo
    @State private var labelPosX:CGFloat = 0

    var body: some View {
        SlideAnimation {
            NumberPad() { numKey in
                
                if numKey.isDeleteKey {
                    
                    if info.numPadValue.count >= 1 {
                        info.numPadValue.removeLast()
                    }
                    
                    return

                    
                }
                
                if info.numPadValue == "0" {
                    info.numPadValue = numKey.string
                    return
                }
                
                info.numPadValue.append(numKey.string)
                
                
            }
            .frame(width: 324, height: 430)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backGroundColor)
        .gesture(DragGesture()
                   .onEnded({ value in
                       
                       if (abs(value.translation.width) < 10) {
                           return
                       }
                       
                       if (value.translation.width < 0 ) {
                           moveForward(to: .first, router)

                           self.labelPosX -= 30
                       } else if (value.translation.width > 0 ) {
                           self.labelPosX += 30
                           moveBack(to: .second, router)

                       }
                   })
               )
    }
}
