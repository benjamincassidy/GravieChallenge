//
//  GravieChallengeApp.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/27/23.
//

import SwiftUI

@main
struct GravieChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            let cartRepository = CartRepository()
            ContentView(
                searchViewModel: SearchViewModel(cartRepository: cartRepository), checkoutViewModel: CheckoutViewModel(cartRepository: cartRepository)
            )
        }
    }
}
