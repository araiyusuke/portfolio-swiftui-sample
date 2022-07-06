//
//  SecondScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI
import Combine
import ResizableSheet

struct SecondScreen: ScreenMovable {
    
    enum InputState {
        case supplier, description
    }
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var header : Header
    
    @State private var inputState: InputState? = nil
    @State private var cancellables = Set<AnyCancellable>()
    @State private var labelPosX:CGFloat = 0
    @State private var supplierText = ""
    @State private var descriptionText = ""
    @State private var pullDownItems: [PullDownItem] = []
    @State private var state: ResizableSheetState = .hidden
    
    var body: some View {
        
        SlideAnimation {
            
            VStack(spacing: 15) {
                
                supplier
                
                HStack(spacing: 3) {
                    
                    inputSuppliers
                    
                    pullDown
                        .onButtonTap() {
                            self.inputState = .supplier
                            
                            SuppliersAPI.fetch()
                                .receive(on: DispatchQueue.main)
                                .sink(receiveCompletion: { completion in
                                    print(completion)
                                }, receiveValue: { response in
                                    pullDownItems = response.suppliers
                                    state = .medium
                                    
                                })
                                .store(in: &cancellables)
                        }
                        .resizableSheet($state) { builder in
                            builder.content { context in
                                
                                BottomSheetList(items: $pullDownItems , state: $state) { value in
                                    if (inputState == .supplier) {
                                        self.supplierText = value.name
                                    } else if (inputState == .description) {
                                        self.descriptionText = value.name
                                    }
                                }
                                .frame(height: 600)
                            }
                        }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                description
                
                HStack(alignment: .top, spacing: 3) {
                    
                    inputDescription
                    
                    pullDown
                        .onButtonTap() {
                            
                            self.inputState = .description
                            DescriptionsAPI.fetch()
                                .receive(on: DispatchQueue.main)
                                .sink(receiveCompletion: { completion in
                                    print(completion)
                                }, receiveValue: { response in
                                    pullDownItems = response.descriptions
                                    state = .medium
                                    
                                    
                                })
                                .store(in: &cancellables)
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                help
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            /// スワイプするために色を入れる
            .background(Color.backGroundColor)
            .gesture(DragGesture()
                .onEnded({ value in
                    
                    if (abs(value.translation.width) < 10) {
                        return
                    }
                    
                    if (value.translation.width < 0 ) {
                        moveForward(to: .third, router)
                        self.labelPosX -= 30
                    } else if (value.translation.width > 0 ) {
                        self.labelPosX += 30
                        moveBack(to: .first(false), router)
                    }
                })
            )

        }
        .padding(.leading, 30)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear() {
            header.setTitle("取引先・適用入力")
        }
    }
    
    var pullDown: some View {
        Image("pull_down")
            .resizable()
            .frame(width: 18, height: 20)
            .frame(width: 40, height: 40)
            .background(Color.headerColor)
            .cornerRadius(5)
    }
    
    var help: some View {
        Text("取引の内容やメモを入力します。\n入力すると、後で取引を探しやすくなります。\n入力しなくても構いません。")
            .customFont(size: 13, spacing: .short, color: .dark, weight: .light)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var supplier: some View {
        Text("取引先")
            .customFont(size: 12, spacing: .short, color: .dark, weight: .light)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var inputDescription: some View {
        TextEditor(text: $descriptionText)
            .padding(.leading, 10)
            .frame(width: 290, height: 100)
            .background(.white)
            .border(.gray)
    }
    
    var inputSuppliers: some View {
        TextField("取引先を入力(任意)", text: $supplierText)
            .padding(.leading, 10)
            .frame(width: 290, height: 41)
            .background(.white)
            .border(.gray)
    }
    
    var description: some View {
        Text("摘要")
            .customFont(size: 12, spacing: .short, color: .dark, weight: .light)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

