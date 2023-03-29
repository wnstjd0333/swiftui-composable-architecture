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
