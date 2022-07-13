//
//  NumberPad.swift
//  swiftui_test
//
//  Created by 名前なし on 2021/09/01.
//

import SwiftUI

extension EnvironmentValues {
    var keyPadButtonAction: (NumberPad.Key) -> Void {
        get { self[KeyPadButton.ActionKey.self] }
        set { self[KeyPadButton.ActionKey.self] = newValue }
    }
}

struct NumberPad: View {
    
    var onChange: ((NumberPad.Key) -> Void)
    
    var spacing: (x: CGFloat, y:CGFloat) {
        (x: 27, y: 27)
    }
    
    init(
        _ onChange: @escaping ((NumberPad.Key) -> Void)
    ) {
        self.onChange = onChange
    }
    
    private func keyWasPressed(_ key: NumberPad.Key) {
        onChange(key)
    }
    
    func keypadRow(keys: [NumberPad.Key]) -> some View {
        HStack(spacing: spacing.y) {
            ForEach(keys, id: \.self) { key in
                KeyPadButton(key)
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: spacing.x) {
                keypadRow(keys: [.number(7), .number(8), .number(9)])
                keypadRow(keys: [.number(4), .number(5), .number(6)])
                keypadRow(keys: [.number(1), .number(2), .number(3)])
                keypadRow(keys: [.doubleZero, .number(0), .delete])
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .environment(\.keyPadButtonAction, self.keyWasPressed(_:))
        }
    }
    
    enum Key: Hashable {
        
        case number(Int)
        case delete
        case doubleZero
        
        var string: String {
            switch self {
                
            case .number(let num):
                return num.description
            case .doubleZero:
                return "00"
            case .delete:
                return "⌫"
            }
        }
        
        var isDeleteKey: Bool {
            self == .delete
        }
        
        var label: some View {
            
            return Group {
                
                switch self {
                    
                case .doubleZero:
                    Text("00")
                        .customFont(font: .roboto, size: 36, spacing: .short, color: .dark, weight: .light)
                    
                case .number(let num):
                    
                    Text(num.description)
                        .customFont(font: .roboto, size: 36, spacing: .short, color: .dark, weight: .light)
                    
                case .delete:
                    
                    ZStack(alignment: .bottom) {
                        
                        Text("消去")
                            .customFont(font: .roboto, size: 13, spacing: .short, color: .dark, weight: .light)
                            .offset(y: -8)
                        
                        
                        ZStack(alignment: .center) {
                            Image("remove_icon")
                                .resizable()
                                .frame(width: 40, height: 24)
                                .offset(x: -2)
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .frame(maxHeight: .infinity)
                }
            }
        }
    }
}
