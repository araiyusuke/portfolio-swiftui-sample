//
//  SupplierEditScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/08.
//

import SwiftUI
import Combine
import ResizableSheet

struct SupplierEditScreen: View {
    
    @State private var cancellables = Set<AnyCancellable>()
    @State private var pullDownItems: [PullDownItem] = []
    @State private var state: ResizableSheetState = .hidden
    @State private var supplierText = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("取引先")
                .customFont(size: 13, spacing: .short, color: .dark, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(alignment: .top, spacing: 3) {
                
                inputSuppliers
                
                PullDown()
                    .resizableSheet($state) { builder in
                        builder.content { context in
                            BottomSheetList(title: "取引先", items: $pullDownItems , state: $state) { value in
                                self.supplierText = value.name
                            }
                            .frame(height: 600)
                        }
                    }
                    .onButtonTap() {
                        DescriptionsAPI.fetch()
                            .receive(on: DispatchQueue.main)
                            .sink(receiveCompletion: { completion in
                                print(completion)
                            }, receiveValue: { response in
                                pullDownItems = response.descriptions
                                self.state = .medium
                            })
                            .store(in: &cancellables)
                    }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                        
//            Spacer()
        
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.backGroundColor)
        
    }
    
    
    var inputSuppliers: some View {
        TextField("取引先を入力(任意)", text: $supplierText)
            .padding(.leading, 10)
            .frame(width: 290, height: 41)
            .background(.white)
            .border(.gray)
    }
}
