//
//  ListScreen+Sort.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import SwiftUI

extension ListScreen {
    
    enum Sort {
        case new, old
        
        mutating func toggle() {
            if self == .new {
                self = .old
            } else {
                self = .new
            }
        }
        
        var rotate: Double {
            switch(self) {
            case .new:
                return 0
            case .old:
                return 180
            }
        }
        
        var icon : some View {
            Image("sort_icon")
                .resizable()
                .frame(width: 27, height: 27)
                .rotationEffect(.degrees(rotate))
        }
        
        var description: String {
            switch(self) {
            case .new:
                return "新しい取引日順"
            case .old:
                return "古い取引日順"
            }
        }
    }
    
}
