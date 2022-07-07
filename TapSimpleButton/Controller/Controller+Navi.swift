//
//  FirstScreen+Footer.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    var horizontalLine: some View {
        Rectangle()
            .fill(Color.black)
    }
    
    static let naviItems = ["1","2","3"]
    static let alignments: [Alignment] = [.leading,.center, .trailing]
    static let targets: [ScreenType] = [.transactionInput(false), .second, .third]

    func isActive(_ index: Int) -> Bool {
        Controller.targets[index] == router.screen
    }
    
    var navi : some View {
        
        VStack(spacing: 0){
            
            ZStack {
           
                horizontalLine
                    .frame(maxWidth: .infinity, maxHeight: 2)
                
                HStack(spacing: 0) {
                    ForEach(0..<Self.naviItems.count, id: \.self) { index in
                        VStack {
                            Text(Self.naviItems[index])
                                .foregroundColor(isActive(index) ? .white : .black)
                                .backgroundCircle(isActive(index) ? .black : .white, 25, .fontColor, 3)
                                .frame(width: 25, height: 25)
                                .frame(maxWidth: .infinity, maxHeight:  50, alignment: Self.alignments[index])
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 25)
            }
            .frame(maxWidth: .infinity , maxHeight: 50)
            
            HStack {
                Text("科目")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("取引先・摘要")
                    .customFont(size: 10, spacing: .none, color: .dark, weight: .light)
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("金額")
                    .customFont(size: 11, spacing: .short, color: .dark, weight: .light)
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
