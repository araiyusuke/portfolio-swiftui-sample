//
//  BottomMenuType.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/03.
//

import Foundation
import SwiftUI

enum BottomMenuType: Identifiable {
    var id: Self { self }
    case list, input, camera, help, etc
    var image: some View {
        Image(systemName: imageName )
            .resizable()
            .scaledToFit()
            .frame(width: 33, height: 33)
    }
    var imageName: String {
        switch self {
        case .list:
            return "apps.ipad.landscape"
        case .input:
            return "text.insert"
        case .camera:
            return "camera"
        case .help:
            return "questionmark.circle"
        case .etc:
            return "gearshape"
        }
    }
    var description: String {
        switch self {
        case .list:
            return "取引一覧"
        case .input:
            return "取引入力"
        case .camera:
            return "レシート撮影"
        case .help:
            return "ヘルプ"
        case .etc:
            return "その他"
        }
    }
}
