//
//  TransactionDescriptionScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/07.
//

import SwiftUI
import ResizableSheet

struct TransactionsDetailScreen: View {
    
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var headerManager : HeaderManager

    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            // ボトムシート表示時は画面操作を禁止させる
            if viewModel.isOpenBottomSheets {
                overlay
            }
            
            VStack(spacing: 0) {
                
                // 編集説明
                transactionEditHelp
                    .frame(height: 80)

                // 内容
                detailContents
                    .frame(height: 400)
                
                Spacer()
                
                Button(action: deleteTransactionAction ) {
                    deleteBtn
                }
               
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .bottom)
            
            if viewModel.isOpenBottomSheets {
                
                VStack {
                    
                    if let bottomSheetState = viewModel.bottomSheetState {
                        
                        bottomSheetsHeader(title: bottomSheetState.description)

                        if bottomSheetState == .date {
                            picker
                        } else if bottomSheetState == .account {
                            accountList
                        }
                    }
                }
                .background(Color.white)
                .zIndex(.infinity)
                .transition(.move(edge: .bottom))
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.rgb(247, 247, 247))
        .customNavigation(leading: "戻る", center: "取引詳細", trailing: "保存")
        .onAppear() {
            viewModel.onAppear()
            headerManager.isShow = false
        }
    }
    
    public func pickerChange(_ value: Date) {
        
    }
    
    // ボトムシート閉じるボタンとタイトル
    private func bottomSheetsHeader(title: String) -> some View {
        
        HStack {

            ZStack {
                // 日付 or 勘定名をタイトルにもつ
                Text(title)
                    .customFont(size: 14, spacing: .none, color: .dark, weight: .light)

                // 閉じるボタンは右に寄せる
                ZStack {
                    Text("X")
                        .padding(10)
                        .foregroundColor(.black)
                        .onTapGesture {
                            withAnimation {
                                viewModel.closeBottomSheets()
                            }
                        }
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .background(Color.rgb(240, 240, 240))
    }
    
    let deleteTransactionAction = { () -> () in
        print("削除")
    }
    
    // 説明
    var transactionEditHelp: some View {
        
        HStack {
            
            VStack {
                
                Spacer()
                
                Text("取引内容")
                    .customFont(size: 12, spacing: .none, color: .dark, weight: .light)
            }
           
            Spacer()
            
            Text("この取引は編集可能です\n項目タップで編集開始")
                .customFont(size: 12, spacing: .none, rgb: Color.rgb(65,144,210), weight: .light)
        }
        .padding()
    }
    
    var picker: some View {
        DatePicker("", selection: $viewModel.selectionDate, displayedComponents: .date)
            .onChange(of: viewModel.selectionDate) { date in
                viewModel.pickerChange(date: date)
            }
            .datePickerStyle(WheelDatePickerStyle())
                  .labelsHidden()
    }
    
    // 取引詳細を削除するためのボタン
    var deleteBtn: some View {
        Text("削除")
            .customFont(size: 16, spacing: .none, rgb: .red, weight: .light)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(.white)
            .padding(.vertical, 15)
    }
    
    var accountList: some View {
        List {
            ForEach(viewModel.accounts) { account in
                Text(account.name)
                    .customFont(size: 14, spacing: .none, color: .dark, weight: .light)
                    .frame(maxWidth: .infinity)
                    .onButtonTap() {
                        viewModel.transaction.accounts = account.name
                        withAnimation {
                            viewModel.closeBottomSheets()
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .listStyle(.plain)
        .background(Color.white)
        .frame(height: 400)
    }
    
    // 取引詳細の内容
    var detailContents : some View {
        
        List {
            
            HStack {
                Text("取引日")
                    .customFont(size: 15, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                
                Text(viewModel.transaction.date)
                    .customFont(size: 15, spacing: .none, color: .dark, weight: .light)
                
            }
            .onButtonTap() {
                withAnimation {
                    viewModel.selectionDate = viewModel.transaction.pickerDate
                    viewModel.showBottomSheets(.date)
                }
            }
            
            HStack {
                Text("科目")
                    .customFont(size: 15, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                
                Text(viewModel.transaction.accounts)
                    .customFont(size: 15, spacing: .none, color: .dark, weight: .light)
                
            }
            .onButtonTap() {
                withAnimation {
                    viewModel.showBottomSheets(.account)
                }
            }
            
            HStack {
                
                Text("取引先")
                    .customFont(size: 15, spacing: .none, color: .dark, weight: .light)
                
                NavigationLink(
                    destination:
                        SupplierEditScreen(editText: $viewModel.transaction.supplier),
                    label: {
                        
                        Spacer()
                        
                        Text(viewModel.transaction.supplier ?? "")
                            .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                        
                    }
                )
                .isDetailLink(false)
                
            }
            
            HStack {
                Text("摘要")
                    .customFont(size: 15, spacing: .none, color: .dark, weight: .light)
                
                NavigationLink(
                    destination: DescriptionEditScreen(editText: $viewModel.transaction.description),
                    label: {
                        
                        Spacer()
                        
                        Text(viewModel.transaction.description ?? "")
                            .customFont(size: 15, spacing: .none, color: .dark, weight: .light)
                        
                    }
                )
                .isDetailLink(false)
            }
            
            HStack {
                
                Text("金額(税込)")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                 
                TextField("¥0", value: $viewModel.transaction.price, formatter: NumberFormatter())
                    .font(Font.custom("NotoSansJP", size: 15))
                    .multilineTextAlignment(TextAlignment.trailing)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 10)
                  
            }
        }
        .listStyle(.plain)
        
    }
}

extension TransactionsDetailScreen {
    
    enum BottomSheetState {
        
        // 取引日
        case date
        // 科目
        case account
        
        var description: String {
            switch self {
            case .date:
                return "取引日"
            case .account:
                return "科目"
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
                viewModel.closeBottomSheets()
            }
        }
    }
}
