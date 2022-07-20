//
//  ListScreen+Sort.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import SwiftUI

extension TransactionsListScreen {
    enum Sort {
        case new, old
        var orderBy: ComparisonResult {
            switch self {
            case .old:
                return .orderedAscending
            case .new:
                return .orderedDescending
            }
        }
        mutating func toggle() {
            if self == .new {
                self = .old
            } else {
                self = .new
            }
        }
        var rotate: Double {
            switch self {
            case .new:
                return 0
            case .old:
                return 180
            }
        }
        /// 上と下の矢印
        var icon : some View {
            Image(Asset.sortIcon)
                .resizable()
                .adjustSize(width: 27, height: 27)
                .rotationEffect(.degrees(rotate))
        }
        /// 矢印の右にある文字列(新しい取引日順、古い取引日順)
        var description: String {
            switch self {
            case .new:
                return "新しい取引日順"
            case .old:
                return "古い取引日順"
            }
        }
    }
}
