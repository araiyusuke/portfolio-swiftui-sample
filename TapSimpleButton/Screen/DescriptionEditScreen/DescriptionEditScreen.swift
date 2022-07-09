//
//  DescriptionEditScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/08.
//

import SwiftUI
import Combine
import ResizableSheet

struct DescriptionEditScreen: View {
    
    @State private var cancellables = Set<AnyCancellable>()
    @State private var pullDownItems: [PullDownItem] = []
    @State private var state: ResizableSheetState = .hidden
    @Binding var editText: String?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("摘要")
                .customFont(size: 13, spacing: .short, color: .dark, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .top, spacing: 3) {
                
                inputDescription
                
                PullDown()
                    .resizableSheet($state) { builder in
                        builder.content { context in
                            BottomSheetList(title: "摘要", items: $pullDownItems , state: $state) { value in
                                self.editText = value.name
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
            
            help
            
            Spacer()
            
            if self.state == .medium {
                Text("うほ")
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .background(Color.red)
                    .onTapGesture {
                        self.state = .hidden
                    }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.backGroundColor)
        .navigationTitle("取引詳細")
        .navigationBarBackButtonHidden(true)
               .toolbar {
                   ToolbarItem(placement: .navigationBarLeading) {
                       Button(
                           action: {
                               dismiss()
                           }, label: {
                               HStack {
                                   Image(systemName: "arrow.backward")
                                   
                                   Text("戻る")
                               }
                             
                           }
                       ).tint(.white)
                   }

               }


    }
    
    var inputDescription: some View {
        TextEditor(text: $editText.toUnwrapped(defaultValue: ""))
            .padding(.leading, 10)
            .frame(width: 290, height: 100)
            .background(.white)
            .border(.gray)
    }
    
    var help: some View {
        Text("取引の内容やメモを入力します。\n入力すると、後で取引を探しやすくなります。\n入力しなくても構いません。")
            .customFont(size: 13, spacing: .short, color: .dark, weight: .light)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
