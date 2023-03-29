//
//  ProductDomain.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/29.
//

import Foundation
import ComposableArchitecture

struct ProductDomain {
    struct State: Equatable {
        let product: Product
        var addToCartState = AddToCartDomain.State()
    }

    enum Action: Equatable {
        case addToCart(AddToCartDomain.Action)
    }

    struct Environment {
        
    }
    
    static let reducer = AnyReducer<State, Action, Environment>
        .combine(
            AddToCartDomain.reducer
                .pullback(
                    state: \.addToCartState,
                    action: /ProductDomain.Action.addToCart,
                    environment: { _ in
                        AddToCartDomain.Environment()
                    }
                ),
            .init { state, action, environment in
                switch action {
                case .addToCart(.didTapPlusButton):
                    return .none
                case .addToCart(.didTapMinusButton):
                    state.addToCartState.counter = max(0, state.addToCartState.counter)
                    return .none
                }
            }
        )
}
