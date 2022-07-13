//
//  Transaction.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/04.
//

import Foundation
import Combine
import SwiftUI

struct Transactions: Mockable, Hashable{
    var transactions: [Transaction]
}

struct TransactionDate {
    static let dateFormat: String = "yyyy/MM/dd"

}

struct Transaction: Mockable, Hashable, Identifiable {
    
    var id: Int
    var accounts: String
    var date: String
    var price: Int
    var hex: String
    var supplier: String?
    var description: String?
    var color: Color {
        return Color.hex(hexString: hex, alpha: 0.3)
    }
    
    var pickerDate: Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = TransactionDate.dateFormat
        return formatter.date(from: date) ?? Date()
    }
    
    var cell: some View {
        
        ZStack {
            
            Text(accounts)
                .customFont(size: 12, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
            
            HStack(spacing: 0) {
                
                VStack(spacing: 0) {
                    
                }
                .frame(maxWidth: 7, maxHeight: .infinity)
                .background(color)
                .padding(.vertical, 2)
                
                
                VStack (spacing: 10) {
                    
                    HStack(spacing: 0) {
                        
                        Text(date)
                            .customFont(size: 12, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
                        
                        Spacer()
                        
                        Text("¥\(price)")
                            .customFont(size: 12, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
                        
                    }
                    
                    HStack(spacing: 0) {
                        Text(description ?? "適用未入力")
                            .customFont(size: 13, spacing: .none, rgb: Color.rgb(89,89,89), weight: .light)
                        
                        Spacer()
                        
                        image
                        
                    }
                }
                .padding(.leading, 5)
                
//                rightArrow
//                    .frame(width: 30)
            }
        }
        
    }
    var rightArrow: some View {
        Image("right_allow_icon" )
            .resizable()
            .frame(width: 10, height: 14)
    }
    
    
    var image: some View {
        Image("pencil_icon" )
            .resizable()
            .frame(width: 20, height: 20)
    }
}

