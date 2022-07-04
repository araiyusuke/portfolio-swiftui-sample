//
//  SecondScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/02.
//

import Foundation
import SwiftUI
import Combine

struct SecondScreen: ScreenMovable {
    
    @State private var cancellables = Set<AnyCancellable>()

    @EnvironmentObject var router : Router
    @EnvironmentObject var info : HeaderInfo

    @State private var labelPosX:CGFloat = 0
    @State var torihiki = ""
    @State var editText = ""

    var body: some View {
        
        SlideAnimation {
            
            VStack(spacing: 15) {
                
                suppliers
                
                HStack(spacing: 3) {
                    inputSuppliers
                    pullDown
                        .onButtonTap() {
                            SuppliersAPI.fetch()
                                .receive(on: DispatchQueue.main)
                                .sink(receiveCompletion: { completion in
                                    print(completion)
                                }, receiveValue: { response in
                                    print(response)
                                })
                                .store(in: &cancellables)
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                description
                
                HStack(alignment: .top, spacing: 3) {
                    
                    inputDescription
                        
                    pullDown
                        .onButtonTap() {
                            DescriptionsAPI.fetch()
                                .receive(on: DispatchQueue.main)
                                .sink(receiveCompletion: { completion in
                                    print(completion)
                                }, receiveValue: { response in
                                    print(response)
                                })
                                .store(in: &cancellables)
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                help
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
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
                               moveBack(to: .first, router)

                           }
                       })
                   )
        }
        .padding(.leading, 30)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear() {
            info.title = "取引先・適用入力"
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
    
    var suppliers: some View {
        Text("取引先")
            .customFont(size: 12, spacing: .short, color: .dark, weight: .light)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var inputDescription: some View {
        TextEditor(text: $editText)
            .padding(.leading, 10)
            .frame(width: 290, height: 100)
            .background(.white)
            .border(.gray)
    }
    
    var inputSuppliers: some View {
        TextField("取引先を入力(任意)", text: $torihiki)
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
