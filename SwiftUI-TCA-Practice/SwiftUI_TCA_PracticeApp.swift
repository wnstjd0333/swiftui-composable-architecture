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
    let store = Store(initialState: State(), reducer: reducer, environment: Environment())
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
