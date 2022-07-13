//
//  Loadable.swift
//  TapSimpleButton
//
//  Created by 名前なし on 2022/07/05.
//

import Foundation
import SwiftUI
import Combine

typealias LoadableSubject<Value> = Binding<Loadable<Value>>

enum Loadable<T> {

    case notRequested
    case isLoading
    case loaded(T)
    case failed(Error)

    var value: T? {
        switch self {
        case let .loaded(value): return value
        case .isLoading: return nil
        default: return nil
        }
    }

    var error: Error? {
        switch self {
        case let .failed(error): return error
        default: return nil
        }
    }
}
