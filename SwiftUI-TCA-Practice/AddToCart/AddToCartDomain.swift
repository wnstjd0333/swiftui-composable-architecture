//
//  AddToCartDomain.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/28.
//

import SwiftUI
import ComposableArchitecture

struct AddToCartDomain {
    struct State: Equatable {
        var counter = 0
    }

    enum Action: Equatable {
        case didTapPlusButton
        case didTapMinusButton
    }

    struct Environment {
        // Feature Dependencies..
    }

    static let reducer = AnyReducer<State, Action, Environment> { state, action, environment in
        switch action {
        case .didTapPlusButton:
            state.counter += 1
            return .none
        case .didTapMinusButton:
            state.counter -= 1
            return .none
        }
    }
}
