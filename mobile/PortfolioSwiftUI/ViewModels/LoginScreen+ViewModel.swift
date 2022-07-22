//
//  LoginScreen+ViewModel.swift
//  PortfolioSwiftUI
//
//  Created by 名前なし on 2022/07/22.
//

import SwiftUI
import Combine

extension LoginScreen {
    class ViewModel: ObservableObject {
        let container: DIContainer
        private var cancellables = Set<AnyCancellable>()
        @Published public var fetchTokenResult: Loadable<String>
        @Published public var email: String = ""
        @Published public var password: String = ""

        init(container: DIContainer, token: Loadable<String> = .notRequested) {
            self.container = container
            self._fetchTokenResult = .init(initialValue: token)
        }

        public func login() {
            fetchTokenResult = .isLoading
            self.container.services.user.fetchToken()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        self.fetchTokenResult = .failed(error)
                    }
                }, receiveValue: { response in
                    self.fetchTokenResult = .loaded(response.user.token)
                })
                .store(in: &cancellables)
        }
    }
}
