//
//  CartItem.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/29.
//

import Foundation

struct CartItem: Equatable {
    let product: Product
    let quantity: Int
}

extension CartItem {
    static var sample: [CartItem] {
        [
            .init(product: Product.sample[0], quantity: 3),
            .init(product: Product.sample[1], quantity: 1),
            .init(product: Product.sample[2], quantity: 1)
        ]
    }
}
