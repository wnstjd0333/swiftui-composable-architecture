//
//  ProductListDomain.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/29.
//

import Foundation
import ComposableArchitecture

struct ProductListDomain {
    struct State: Equatable {
        var productList: IdentifiedArrayOf<ProductDomain.State> = []
        var cartState = CartListDomain.State()
        var shouldOpenCart = false
    }
    
    enum Action: Equatable {
        case fetchProducts
        case fetchProductResponse(TaskResult<[Product]>)
        case product(id: ProductDomain.State.ID, action: ProductDomain.Action)
        case setCart(isPresented: Bool)
        case cart(CartListDomain.Action)
    }
    
    struct Environment {
        var fetchProducts: () async throws -> [Product]
    }
    
    static let reducer = AnyReducer<State, Action, Environment>
        .combine(
            ProductDomain.reducer.forEach(
                state: \.productList,
                action: /Action.product(id:action:),
                environment: { _ in ProductDomain.Environment() }
            ),
            CartListDomain.reducer
                .pullback(
                state: \.cartState,
                action: /Action.cart,
                environment: { _ in CartListDomain.Environment() }
            ),
            .init { state, action, environment in
                switch action {
                case .fetchProducts:
                    return .task {
                        await .fetchProductResponse(
                            TaskResult {
                                try await environment.fetchProducts()
                            }
                        )
                    }
                case .fetchProductResponse(.success(let products)):
                    state.productList = IdentifiedArray(
                        uniqueElements: products
                            .map {
                                ProductDomain.State(id: UUID(), product: $0)
                            }
                    )
                    return .none
                case .fetchProductResponse(.failure(let error)):
                    print(error)
                    print("Unable to fetch products")
                    return .none
                case .product:
                    return .none
                case .cart(let action):
                    switch action {
                    case .didPressCloseButton:
                        state.shouldOpenCart = false
                    }
                    return .none
                case .setCart(let isPresented):
                    state.shouldOpenCart = isPresented
                    state.cartState.cartItems = IdentifiedArray(
                        uniqueElements: state.productList.compactMap { state in
                            state.addToCartState.count > 0
                            ? CartItemDomain.State(
                                id: UUID(),
                                cartItem: CartItem(
                                    product: state.product,
                                    quantity: state.addToCartState.count
                                )
                            )
                            : nil
                        }
                    )
                    return .none
                }
            }
        )
        .debug()
}
