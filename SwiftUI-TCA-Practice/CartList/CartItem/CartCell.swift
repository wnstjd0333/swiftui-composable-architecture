//
//  CartCell.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/29.
//

import SwiftUI
import ComposableArchitecture

struct CartCell: View {
    let store: Store<CartItemDomain.State, CartItemDomain.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                HStack {
                    AsyncImage(url: URL(string: viewStore.cartItem.product.imageString)) {
                        $0.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                    VStack(alignment: .leading) {
                        Text(viewStore.cartItem.product.title)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                        HStack {
                            Text("$\(viewStore.cartItem.product.price.description)")
                                .font(.custom("AmericanTypewriter", size: 25))
                                .fontWeight(.bold)
                        }
                    }
                }
                Group {
                    Text("Quantity: ")
                    +
                    Text("\(viewStore.cartItem.quantity)")
                        .fontWeight(.bold)
                }
                .font(.custom("AmericanTypewriter", size: 25))
            }
        }
    }
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        CartCell(
            store: Store(
                initialState: CartItemDomain.State(
                    id: UUID(),
                    cartItem: CartItem.sample.first!
                ),
                reducer: CartItemDomain.reducer,
                environment: CartItemDomain.Environment()
            )
        )
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
