//
//  FirstScreen+Footer.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension TransactionInputScreen {
    var footer : some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                back
                    .adjustPadding(.leading, 5)
                    .frame(width: geometry.size.width * 0.2, alignment: .leading)
                Group {
                    navi
                        .adjustSize(width: 170, height: 45)
                }
                .frame(width: geometry.size.width * 0.6)

                nextOrRegist
                    .adjustPadding(.trailing, 10)
                    .frame(width: geometry.size.width * 0.2, alignment: .trailing)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .trailing)
        }
    }
}
