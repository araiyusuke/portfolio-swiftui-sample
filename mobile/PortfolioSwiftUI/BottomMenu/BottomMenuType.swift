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
            .adjustSize(width: 33, height: 33)
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
            return L10n.transactions
        case .input:
            return L10n.inputTransaction
        case .camera:
            return "レシート撮影"
        case .help:
            return L10n.help
        case .etc:
            return L10n.others
        }
    }
}
