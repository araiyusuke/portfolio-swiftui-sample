//
//  DescriptionEditScreen.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/08.
//

import SwiftUI
import Combine
import ResizableSheet

struct DescriptionEditScreen: View {
    @State private var cancellables = Set<AnyCancellable>()
    @State private var pullDownItems: [PullDownItem] = []
    @State private var state: ResizableSheetState = .hidden
    @Binding var editText: String?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: adjust(20)) {
            Text(L10n.descriptions)
                .customFont(size: 13, spacing: .short, weight: .light)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(alignment: .top, spacing: adjust(3)) {
                inputDescription
                PullDown()
                    .resizableSheet($state) { builder in
                        builder.content { _ in
                            BottomSheetList(title: L10n.descriptions, items: $pullDownItems, state: $state) { value in
                                self.editText = value.name
                            }
                            .adjustSize(height: 600)
                        }
                    }
                    .onButtonTap {
                        DescriptionsAPI.fetch()
                            .receive(on: DispatchQueue.main)
                            .sink(receiveCompletion: { completion in
                                print(completion)
                            }, receiveValue: { response in
                                pullDownItems = response.descriptions
                                self.state = .medium
                            })
                            .store(in: &cancellables)
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            help
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Asset.screenBackColor.color)
        .customNavigation(leading: L10n.back, center: "\(L10n.account)入力") {
        }

    }
    var inputDescription: some View {
        TextEditor(text: $editText.toUnwrapped(defaultValue: ""))
            .adjustPadding(.leading, 10)
            .adjustSize(width: 290, height: 100)
            .foregroundColor(Asset.inputText.color)
            .background(.white)
            .border(.gray)
            .onAppear {
                UITextView.appearance().backgroundColor = .clear
            }.onDisappear {
                UITextView.appearance().backgroundColor = nil
            }
    }
    var help: some View {
        Text("取引の内容やメモを入力します。\n入力すると、後で取引を探しやすくなります。\n入力しなくても構いません。")
            .customFont(size: adjust(13), spacing: .short, weight: .light)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
