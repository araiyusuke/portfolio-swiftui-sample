//
//  Controller+BottomMenu.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

extension Controller {
    
    static let menus: [BottomMenuType] = [
        .list,
        .input,
        .camera,
        .help,
        .etc,
    ]
    
    func rgb(_ flag: Bool) -> Color {
        return flag ? Color.blue: Color.rgb(127, 127, 127)
    }
    
}
