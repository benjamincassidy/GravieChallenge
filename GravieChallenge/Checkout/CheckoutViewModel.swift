//
//  CheckoutViewModel.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import Foundation
import Combine

@MainActor
class CheckoutViewModel: ObservableObject {
    private let cartRepository: CartRepository
    
    @Published private(set) var count: Int = 0
    @Published private(set) var games: [CartItem] = []
    @Published var showConfirmationDialog = false
    
    private var cancellable: AnyCancellable?
    
    init(cartRepository: CartRepository) {
        self.count = 0
        self.cartRepository = cartRepository
        cancellable = self.cartRepository.$games.sink { games in
            self.games = games
            self.count = self.games.count
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func cancelCheckout() {
        self.showConfirmationDialog = false
    }
    
    func checkout() {
        self.showConfirmationDialog = true
    }
    
    func finalizeCheckout() {
        self.showConfirmationDialog = false
        self.cartRepository.checkout()
    }
}
