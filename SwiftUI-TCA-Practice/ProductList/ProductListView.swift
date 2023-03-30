//
//  ProductListView.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/29.
//

import SwiftUI
import ComposableArchitecture

struct ProductListView: View {
    let store: Store<ProductListDomain.State, ProductListDomain.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationStack {
                List {
                    ForEachStore(
                        self.store.scope(
                            state: \.productList,
                            action: ProductListDomain.Action.product(id:action:))
                    ) {
                        ProductCell(store: $0)
                    }
                }
                .task {
                    viewStore.send(.fetchProducts)
                }
                .navigationTitle("Products")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewStore.send(.setCart(isPresented: true))
                        } label: {
                            Text("Go to Cart")
                        }
                    }
                }
                .sheet(
                    isPresented: viewStore.binding(
                        get: \.shouldOpenCart,
                        send: ProductListDomain.Action.setCart(isPresented:)
                    )
                ) {
                    CartListView(
                        store: Store(
                            initialState: CartListDomain.State(
                                cartItems: IdentifiedArrayOf(
                                    uniqueElements: CartItem.sample
                                        .map {
                                            CartItemDomain.State(
                                                id: UUID(),
                                                cartItem: $0
                                            )
                                        }
                                )
                            ),
                            reducer: CartListDomain.reducer,
                            environment: CartListDomain.Environment())
                    )
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(
            store: Store(
                initialState: ProductListDomain.State(),
                reducer: ProductListDomain.reducer,
                environment: ProductListDomain.Environment(fetchProducts: { Product.sample })
            )
        )
    }
}
