//
//  FirstScreen+Footer.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    var navi : some View {
        
//        GeometryReader { geometry in
            
        VStack(spacing: 0){
                

                ZStack {
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 2)
                    
                    
                    HStack(spacing: 0) {
                        
                        VStack {
                            
                            Text("1")
                                .foregroundColor(.white)
                                .backgroundCircle(.black, 25, Color.fontColor, 3)
                                .frame(width: 25, height: 25)
                                .frame(maxWidth: .infinity, maxHeight:  50, alignment: .leading)
                            
                            
                        }
                        .frame(maxWidth: .infinity , maxHeight: 50)

                        
                        VStack {
                            
                            Text("2")
                                .backgroundCircle(.white, 25, Color.fontColor, 3)
                                .frame(width: 25, height: 25)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                        }
                        
                        VStack {
                            
                            
                            Text("3")
                                .backgroundCircle(.white, 25, Color.fontColor, 3)
                                .frame(width: 25, height: 25)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 25)
                    
                }
                .frame(maxWidth: .infinity , maxHeight: 50)
                
                
                HStack {
                    Text("科目")
                        .font(.footnote)
                        .fixedSize()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("取引先・摘要")
                        .font(.footnote)
                        .fixedSize()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("金額")
                        .font(.footnote)
                        .fixedSize()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
            
            }
        }
//    }
}
