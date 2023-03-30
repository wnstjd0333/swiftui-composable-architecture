//
//  CartItemDomain.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/29.
//

import Foundation
import ComposableArchitecture

struct CartItemDomain {
    struct State: Equatable, Identifiable {
        let id: UUID
        let cartItem: CartItem
    }
    
    enum Action: Equatable {}
    
    struct Environment {}
    
    static let reducer = AnyReducer<State, Action, Environment> { state, action, environment in
        return .none
    }
}
