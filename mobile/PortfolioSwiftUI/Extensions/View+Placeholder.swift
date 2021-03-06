//
//  View+Placeholder.swift
//  PortfolioSwiftUI
//
//  Created by ććăȘă on 2022/07/17.
//

import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(
        alignment: Alignment = .leading,
        text: String,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            Text(text)
            self
        }
    }
}
