//
//  TransactionDescriptionScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/07.
//

import SwiftUI
import ResizableSheet





struct TransactionsDetailScreen: View {
    
    struct BottomSheetContents: View {
        @Binding var state: BottomSheetState

        var body: some View {
            switch state {
            case .date:
                Text(state.description)
            case .account:
                Text(state.description)
            }
        }
    }

    enum BottomSheetState {
        case date
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
    
    @State private var pickerSelection = 0
    @Binding var transaction: Transaction
    @State var state: ResizableSheetState = .hidden
    @State var bottomSheetState: BottomSheetState = .date

    @State private var pullDownItems: [PullDownItem] = [
        .init(id: 1, name: "A"),
        .init(id: 1, name: "B"),
        .init(id: 1, name: "C")
    ]
    
    @State private var pullDownItems1: [PullDownItem] = [
        .init(id: 1, name: "あ"),
        .init(id: 1, name: "い"),
        .init(id: 1, name: "う")
    ]

    var body: some View {
        
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
            
            Text("削除")
                .customFont(size: 16, spacing: .none, rgb: .red, weight: .light)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(.white)
                .padding(.vertical, 15)
        }
        .background(Color.rgb(247, 247, 247))
        .frame(maxHeight: .infinity)
        .resizableSheet($state) { builder in
            builder.content { context in
                BottomSheetContents(state: $bottomSheetState)
                    .frame(height: 600)
            }
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
                print("タップ")
                bottomSheetState = .date
                state = .medium
            }
            
            HStack {
                Text("科目")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                
                account
                    
            }
            .onButtonTap() {
                bottomSheetState = .account
                state = .medium
                print(bottomSheetState)
            }
            
            HStack {
                
                Text("取引先")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                NavigationLink(
                    destination:
                        SupplierEditScreen(editText: $transaction.supplier)
                        .environment(\.resizableSheetCenter, resizableSheetCenter)
                    ,
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
                    destination: DescriptionEditScreen(editText: $transaction.description)
                        .environment(\.resizableSheetCenter, resizableSheetCenter),
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
                
                Spacer()
                
                TextField("placeholder", value: $transaction.price, formatter: NumberFormatter())
                    .font(Font.custom("NotoSansJP", size: 13))
                    .multilineTextAlignment(TextAlignment.trailing)
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

