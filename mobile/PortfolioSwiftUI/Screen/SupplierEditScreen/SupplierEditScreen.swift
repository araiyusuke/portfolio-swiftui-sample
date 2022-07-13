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
    @State public var state: ResizableSheetState = .hidden
    @Binding public var editText: String?
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text("取引先")
                .customFont(size: 13, spacing: .short, color: .dark, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(alignment: .top, spacing: 3) {
                
                inputSuppliers
                
                PullDown()
                
                    .onButtonTap() {
                        self.state = .medium
                        
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
                    .resizableSheet($state) { builder in
                        builder.content { context in
                            BottomSheetList(title: "取引先", items: $pullDownItems , state: $state) { value in
                                self.editText = value.name
                            }
                            .frame(height: 600)
                        }
                    }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        .background(Color.backGroundColor)
        .customNavigation(leading: "戻る", center: "取引先入力")
        
    }
    
    var inputSuppliers: some View {
        TextField("取引先を入力(任意)", text: $editText.toUnwrapped(defaultValue: ""))
            .padding(.leading, 10)
            .frame(width: 290, height: 41)
            .background(.white)
            .border(.gray)
    }
}

extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
