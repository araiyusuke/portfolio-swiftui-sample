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
    @EnvironmentObject var header : Header
    
    @State private var labelPosX:CGFloat = 0
    @State var supplierText = ""
    @State var descriptionText = ""
    @State private var showingSheet1 = false
    @State private var showingSheet2 = false

    @State private var suppliers: [Supplier] = []
    @State private var descriptions: [Description] = []

    var body: some View {
        
        SlideAnimation {
            
            VStack(spacing: 15) {
                
                supplier
                
                HStack(spacing: 3) {
                    
                    inputSuppliers
                    
                    pullDown
                        .onButtonTap() {
                                      
                            showingSheet1 = true

                            SuppliersAPI.fetch()
                                .receive(on: DispatchQueue.main)
                                .sink(receiveCompletion: { completion in
                                    print(completion)
                                }, receiveValue: { response in
                                    suppliers = response.suppliers
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
                            showingSheet2 = true
                            DescriptionsAPI.fetch()
                                .receive(on: DispatchQueue.main)
                                .sink(receiveCompletion: { completion in
                                    print(completion)
                                }, receiveValue: { response in
                                    descriptions = response.descriptions
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
        
        if showingSheet1 {
            BottomSheetView(isOpen: $showingSheet1, maxHeight: 600) {
                suppliersList
            }
            .edgesIgnoringSafeArea(.all)
        }
        
        if showingSheet2 {
            BottomSheetView(isOpen: $showingSheet2, maxHeight: 600) {
                        descriptionsList
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    var suppliersList : some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                
                Text("取引先")
                
                ZStack {
                    
                    Text("閉じる")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            showingSheet1 = false
                        }
                    
                }
            }
            
            Text("検索結果: \(suppliers.count)件")
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.black.opacity(0.3))
            
            List {
                ForEach(suppliers) { supplier in
                    Text(supplier.name)
                        .onButtonTap(){
                            self.supplierText = supplier.name
                        }
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxHeight: .infinity)
        }
    }
    
    var descriptionsList: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                
                Text("摘要")
                
                ZStack {
                    
                    Text("閉じる")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            showingSheet2 = false
                        }
                    
                }
            }
            
            Text("検索結果: \(descriptions.count)件")
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.black.opacity(0.3))
            
            List {
                ForEach(descriptions) { description in
                    Text(description.name)
                        .onButtonTap(){
                            self.descriptionText = description.name
                        }
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxHeight: .infinity)
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
