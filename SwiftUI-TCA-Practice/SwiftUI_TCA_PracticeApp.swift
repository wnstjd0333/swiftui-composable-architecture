//
//  SwiftUI_TCA_PracticeApp.swift
//  SwiftUI-TCA-Practice
//
//  Created by 金峻聖 on 2023/03/28.
//

import SwiftUI
import ComposableArchitecture

@main
struct SwiftUI_TCA_PracticeApp: App {    
    var body: some Scene {
        WindowGroup {
            ProductListView(
                store: Store(
                    initialState: ProductListDomain.State(),
                    reducer: ProductListDomain.reducer,
                    environment: ProductListDomain.Environment(fetchProducts: { Product.sample })
                )
            )
        }
    }
}
