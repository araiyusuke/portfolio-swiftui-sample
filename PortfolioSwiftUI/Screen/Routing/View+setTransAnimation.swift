//
//  View+setTransAnimation.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

extension View {
    func setTransAnimation(direction: Direction = .forward) -> some View {
        if  case .back = direction {
            return self
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
        } else {
            return self
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
    }
}
