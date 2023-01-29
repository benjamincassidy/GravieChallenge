//
//  CartItem.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let platform: Platform
    let game: SearchResultItem
}
