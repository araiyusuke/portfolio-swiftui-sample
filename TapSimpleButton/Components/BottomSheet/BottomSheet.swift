//
//  BottomSheet.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/05.
//

import Foundation

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.0
}

struct BottomSheetView<Content: View>: View {
    
    @Binding var isOpen: Bool

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    @GestureState private var translation: CGFloat = 0

    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    var body: some View {
        ZStack {
            self.content
        }
        .frame(width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height * 0.6)
        .background(.white)
        .frame(height: UIScreen.main.bounds.size.height, alignment: .bottomLeading)
        .background(Color.black.opacity(isOpen == true ?  0.3 : 0))
        .offset(y: max(self.offset + self.translation, 0))
        .animation(.interactiveSpring(), value: isOpen)
        .animation(.interactiveSpring(), value: translation)
//        .gesture(
//            DragGesture().updating(self.$translation) { value, state, _ in
//                state = value.translation.height
//            }.onEnded { value in
//                let snapDistance = self.maxHeight * Constants.snapRatio
//                guard abs(value.translation.height) > snapDistance else {
//                    return
//                }
//                self.isOpen = value.translation.height < 0
//            }
//        )
    }
}
