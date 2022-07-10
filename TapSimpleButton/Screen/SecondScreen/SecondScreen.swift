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

struct SecondScreen: ScreenMovable2 {
    
    enum InputState {
        case supplier, description
    }
    
    @EnvironmentObject var header : Header
    @EnvironmentObject var router : TransactionInputRouter
    
    @State private var inputState: InputState? = nil
    @State private var cancellables = Set<AnyCancellable>()
    @State private var labelPosX:CGFloat = 0
    @State private var supplierText = ""
    @State private var descriptionText = ""
    @State private var pullDownItems: [PullDownItem] = []
    @State private var state: ResizableSheetState = .hidden
    @EnvironmentObject var bottomTab : BottomTabManager

    var body: some View {
        
        SlideAnimation2 {
            
            VStack(spacing: 15) {
                
                supplier
                
                HStack(spacing: 3) {
                    
                    inputSuppliers
                    
                    PullDown()
                        .onButtonTap() {
                            
                            //取引先の入力欄をターゲットにする
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
                                BottomSheetList(title: "取引先",items: $pullDownItems , state: $state) { value in
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
                    
                    PullDown()
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
            .padding(.leading, 30)
            .padding(.top, 20)
            .background(Color.backGroundColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           
        }
        .hiddenNavigationBarStyle()
        .onAppear() {
            bottomTab.isShow = false
        }
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

