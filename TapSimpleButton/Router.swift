//
//  Router.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    
    @Published var screen: ScreenType = .first
    @Published var direction: Direction = .forward
    
    private init() {}
    
    static let shared: Router = .init()
    
    enum Direction {
        case forward, back
    }
}
