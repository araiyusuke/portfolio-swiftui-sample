//
//  TransactionDescriptionScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/07.
//

import SwiftUI
import ResizableSheet

struct TransactionsDetailScreen: View {
    @EnvironmentObject var router : Router
    @Environment(\.dismiss) var dismiss
    
    // ボトムシートの表示管理
    @State private var isShowBottomSheet: Bool = false
    
    @EnvironmentObject var headerManager : HeaderManager

    
    @State private var pickerSelection = 0
    @Binding var transaction: Transaction
    @State var state: ResizableSheetState = .hidden
    @State var bottomSheetState: BottomSheetState = .date
    @State private var selectionDate = Date()    // Date構造体の生成、初期値は現在日時
    
   
    
    var bottomSheetsHeader: some View {
        
        HStack {

            ZStack {
                Text("科目")
                    .customFont(size: 14, spacing: .none, color: .dark, weight: .light)

                ZStack {
                    Text("X")
                        .padding(10)
                        .foregroundColor(.black)
                        .onTapGesture {
                            withAnimation {
                                isShowBottomSheet.toggle()
                            }
                        }
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }


        }
        .background(Color.rgb(240, 240, 240))
    }
  
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if isShowBottomSheet {
                overlay
            }
            
            VStack(spacing: 0) {
                
                HStack {
                    Text("取引内容")
                        .customFont(size: 12, spacing: .none, color: .dark, weight: .light)
                    
                    Spacer()
                    
                    Text("この取引は編集可能です\n項目タップで編集開始")
                        .customFont(size: 12, spacing: .none, rgb: Color.rgb(65,144,210), weight: .light)
                }
                .padding()
                .frame(height: 80)
                
                list
                    .frame(height: 400)
                
                Spacer()
                
                Text("削除")
                    .customFont(size: 16, spacing: .none, rgb: .red, weight: .light)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(.white)
                    .padding(.vertical, 15)
                
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .bottom)
            
            if isShowBottomSheet {
                
                VStack {

                   bottomSheetsHeader

                    
                    ///日付
//                    DatePicker("", selection: $selectionDate, displayedComponents: .date)
//                        .datePickerStyle(WheelDatePickerStyle())
//                              .labelsHidden()

                    
                    List {
                        ForEach(Account.all()) { account in
                            Text(account.name)
                                .customFont(size: 14, spacing: .none, color: .dark, weight: .light)
                                .frame(maxWidth: .infinity)
                                .onButtonTap() {
                                    
                                    transaction.accounts = account.name

                                    withAnimation {
                                        isShowBottomSheet.toggle()
                                    }

                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .listStyle(.plain)
                    .background(Color.white)
                    .frame(height: 400)

                }
                .background(Color.white)
                .zIndex(.infinity)
                .transition(.move(edge: .bottom))
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.rgb(247, 247, 247))
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
        }.onAppear() {
            headerManager.isShow = false
        }
    }
    
    
    var list : some View {
        
        List {
            
            HStack {
                Text("取引日")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                
                Spacer()
                
                Text(transaction.date)
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
            }
            .onButtonTap() {
                withAnimation {
                    isShowBottomSheet.toggle()
                }
            }
            
            HStack {
                Text("科目")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                
                account
                
            }
            .onButtonTap() {
                withAnimation {
                    isShowBottomSheet.toggle()
                }
            }
            
            HStack {
                
                Text("取引先")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                NavigationLink(
                    destination:
                        SupplierEditScreen(editText: $transaction.supplier),
                    label: {
                        
                        Spacer()
                        
                        Text(transaction.supplier ?? "")
                            .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                        
                    }
                )
                .isDetailLink(false)
                
            }
            
            HStack {
                Text("摘要")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                NavigationLink(
                    destination: DescriptionEditScreen(editText: $transaction.description),
                    label: {
                        
                        Spacer()
                        
                        Text(transaction.description ?? "")
                            .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                        
                    }
                )
                .isDetailLink(false)
            }
            
            HStack {
                
                Text("金額(税込)")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                    .onTapGesture {
                        transaction.price = 9999
                    }
                
                TextField("placeholder", value: $transaction.price, formatter: NumberFormatter())
                    .font(Font.custom("NotoSansJP", size: 13))
                    .multilineTextAlignment(TextAlignment.trailing)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 10)
                  
            }
        }
        .listStyle(.plain)
        
    }
    
    var account: some View {
        Text(transaction.accounts)
            .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
    }
}

extension TransactionsDetailScreen {
    
    enum BottomSheetState {
        
        // 取引日時
        case date
        // 勘定
        case account
        
        var description: String {
            switch self {
            case .date:
                return "date"
            case .account:
                return "account"
            }
        }
    }
}

// ボトムシート表示時、他の画面操作を向こうにするために表示するオーバーレイ
extension TransactionsDetailScreen {
    var overlay: some View {
        Color
            .black
            .opacity(0.5).zIndex(9)
            .onTapGesture {
            withAnimation {
                isShowBottomSheet.toggle()
            }
        }
    }
}
