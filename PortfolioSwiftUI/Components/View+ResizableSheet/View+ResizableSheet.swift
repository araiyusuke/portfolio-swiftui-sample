//
//  View+ResizableSheet.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/08.
//

import SwiftUI
import ResizableSheet

extension View {
    // ボトムシートライブラリ
    var scene: UIWindowScene? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowScene = scene as? UIWindowScene else {
            return nil
        }
        return windowScene
    }
    
    var resizableSheetCenter: ResizableSheetCenter? {
        return scene.flatMap(ResizableSheetCenter.resolve(for:))
    }
}
