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
    @State var show: Bool = false
    @EnvironmentObject var headerManager : HeaderManager

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
    @State private var selectionDate = Date()    // Date構造体の生成、初期値は現在日時
    @State private var pullDownItems: [PullDownItem] = [
        .init(id: 1, name: "仕入"),
        .init(id: 2, name: "接待交際費"),
        .init(id: 3, name: "旅費交通費"),
        .init(id: 4, name: "通信費"),
        .init(id: 5, name: "雑費"),
        .init(id: 6, name: "荷造運賃"),
        .init(id: 7, name: "消耗品費"),
        .init(id: 8, name: "会議費"),
        .init(id: 9, name: "法定福利費"),
        .init(id: 10, name: "福利厚生費"),
        .init(id: 11, name: "広告宣伝費"),
        .init(id: 12, name: "修繕費"),
        .init(id: 13, name: "水道光熱費"),
        .init(id: 14, name: "新聞図書費"),
        .init(id: 15, name: "支払い手数料"),
        .init(id: 16, name: "車両日"),
        .init(id: 17, name: "地代家賃"),
        .init(id: 18, name: "租税効果"),
        .init(id: 19, name: "損害保険料"),
        .init(id: 20, name: "給料賃金"),
        .init(id: 21, name: "外注工賃"),
        .init(id: 22, name: "利子割引料"),
        .init(id: 23, name: "研修費"),
        .init(id: 24, name: "税理士・弁護士報酬"),
        .init(id: 25, name: "専従者給与"),

    ]
    
    var overlay: some View {
        Color
            .black
            .opacity(0.5).zIndex(9)
            .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
    
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
                                show.toggle()
                            }
                        }
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }


        }
        .background(Color.rgb(240, 240, 240))
    }
  
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if show {
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
            
            if show {
                
                VStack {

                   bottomSheetsHeader

                    
                    ///日付
//                    DatePicker("", selection: $selectionDate, displayedComponents: .date)
//                        .datePickerStyle(WheelDatePickerStyle())
//                              .labelsHidden()

                    
                    List {
                        ForEach(pullDownItems) { item in
                            Text(item.name)
                                .customFont(size: 14, spacing: .none, color: .dark, weight: .light)
                                .frame(maxWidth: .infinity)
                                .onButtonTap() {
                                    
                                    transaction.accounts = item.name

                                    withAnimation {
                                        show.toggle()
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
                    show.toggle()
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
                    show.toggle()
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

