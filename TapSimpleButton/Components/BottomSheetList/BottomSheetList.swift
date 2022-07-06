//
//  BottomSheetList.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/06.
//

import Foundation
import SwiftUI
import ResizableSheet
struct BottomSheetList:  View {
    
    @Binding var items: [PullDownItem]
    @Binding var state: ResizableSheetState
    
    var onSelect : (PullDownItem) -> ()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                
                Text("取引先")
                
                ZStack {
                    
                    Text("閉じる")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            state = .hidden
                        }
                    
                }
            }
            
            Text("検索結果: \(items.count)件")
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.black.opacity(0.3))
            
            List {
                ForEach(items) { item in
                    Text(item.name)
                        .onButtonTap(){
                            onSelect(item)
                            state = .hidden
                        }
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxHeight: .infinity)
        }
    }
}

