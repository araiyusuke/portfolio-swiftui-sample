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
    @EnvironmentObject var header : Header
    @State private var labelPosX:CGFloat = 0
    
    var body: some View {
        SlideAnimation {
            
            NumberPad() { numKey in
                
                if numKey.isDeleteKey {
                    
                    if header.getNumPad().count >= 1 {
                        header.removeLast()
                    }
                    return
                }
                
                if header.getNumPad() == "0" {
                    header.setNumPad(value: numKey.string)
                    return
                }
                header.append(letter: numKey.string)
                
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
                    moveForward(to: .transactionInput(false), router)
                    
                    self.labelPosX -= 30
                } else if (value.translation.width > 0 ) {
                    self.labelPosX += 30
                    moveBack(to: .second, router)
                    
                }
            })
        )
    }
}
