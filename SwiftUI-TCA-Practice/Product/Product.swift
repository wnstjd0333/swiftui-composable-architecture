//
//  Product.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/29.
//

import Foundation

struct Product: Equatable, Identifiable {
    let id: Int
    let title: String
    let price: Double // Update to Currency
    let description: String
    let category: String // Update to enum
    let imageString: String
    
    // Add rating later...
}

extension Product {
    static var sample: [Product] {
        [
            .init(
                id: 1,
                title: "Mens Casual Premium Slim Fit T-Shirts",
                price: 23.3,
                description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
                category: "men's clothing",
                imageString: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
            ),
            .init(
                id: 2,
                title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                price: 109.95,
                description: "Your perfect pack for everyday use and walks in the forest. Stash your laptap (up to 15 inches) in the padded sleeve, your everyday",
                category: "men's clothing",
                imageString: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
            ),
            .init(
                id: 3,
                title: "Mens Cotten Jacket",
                price: 55.99,
                description: "Great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Chrismas Day.",
                category: "men's clothing",
                imageString: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
            )
        ]
    }
}
