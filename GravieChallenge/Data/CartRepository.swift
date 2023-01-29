//
//  CartRepository.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import Foundation

class CartRepository: ObservableObject {
    
    @Published var games: [CartItem] = []
    
    func reserve(item: SearchResultItem, onPlatform platform: Platform) {
        if (!games.contains(where: { $0.platform.id == platform.id && $0.game.id == item.id })) {
            games.append(CartItem(platform: platform, game: item))
        }
    }
    
    func checkout() {
        games.removeAll()
    }
}
