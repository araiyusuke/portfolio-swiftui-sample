//
//  TransactionInputScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/07.
//

import SwiftUI

struct TransactionInputScreen:  ScreenMovable2 {
    
    @EnvironmentObject var router : TransactionInputRouter
    @ObservedObject private(set) var viewModel: ViewModel

    let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
        self.viewModel = .init(container: container)

    }
    var contents: some View {
        
        return ZStack {
            
            switch router.screen {
                
            case .first(let regist):
                FirstScreen(viewModel: FirstScreen.ViewModel(container: container), registed: regist)

            case .second:
                SecondScreen()
                    .environment(\.resizableSheetCenter, resizableSheetCenter)

            case .third:
                ThirdScreen()
                
            }
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            contents
                                   
            footer
                .frame(maxHeight: 60)
                .background(Color.backGroundColor)
        }
        
       
    }
}
