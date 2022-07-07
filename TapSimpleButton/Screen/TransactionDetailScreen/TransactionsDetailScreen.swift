//
//  TransactionDescriptionScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/07.
//

import SwiftUI

struct TransactionsDetailScreen: View {
    
    @State private var pickerSelection = 0
    
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
                .frame(height: 500)
            
            Text("削除")
                .customFont(size: 16, spacing: .none, rgb: .red, weight: .light)
                .padding(.vertical, 15)
            
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(.white)
                .padding(.vertical, 15)
            
            
        }
        .background(Color.rgb(247, 247, 247))
        
    }
    
    var list : some View {
        
        List {
            
            HStack {
                Text("取引日")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                Text("2022/07/06")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
            }   
            
            HStack {
                Text("取引日")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                Text("2022/07/06")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
            }
            
            HStack {
                Text("科目")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                Text("広告宣伝費")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
            }
            
            
            HStack {
                Text("取引先")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                NavigationLink(
                    destination: SupplierEditScreen(),
                    label: {
                        Spacer()
                        
                        Text("セブンイレブン")
                            .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                        
                    }
                )
            }
            
            HStack {
                Text("摘要")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                NavigationLink(
                    destination: DescriptionEditScreen(),
                    label: {
                        Spacer()
                        
                        Text("いい")
                            .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                        
                    }
                )
            }
            
            HStack {
                Text("金額(税込)")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
                Spacer()
                Text("¥0")
                    .customFont(size: 13, spacing: .none, color: .dark, weight: .light)
                
            }
            
        }
        .listStyle(.plain)
    }
}

struct TransactionDescriptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsDetailScreen()
    }
}
