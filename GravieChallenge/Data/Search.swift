//
//  Search.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import Foundation

let baseSearchUrl = "https://www.giantbomb.com/api/search/?api_key=e3082a233e61cb4c182bb242b8e4f215307f7bb4&format=json&query="

struct SearchResponse: Codable {
    let error: String
    let limit: Int
    let offset: Int
    let results: [SearchResultItem]?
    
    enum CodingKeys: String, CodingKey {
        case error, limit, offset, results
    }
}

struct SearchResultItem: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let image: ImageData
    let description: String?
    let platforms: [Platform]?
    
    static func == (lhs: SearchResultItem, rhs: SearchResultItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, description, platforms
    }
}

struct ImageData: Codable {
    let thumbUrl: String
    let screenUrl: String
    let mediumUrl: String
    
    enum CodingKeys: String, CodingKey {
        case thumbUrl = "thumb_url"
        case screenUrl = "screen_url"
        case mediumUrl = "medium_url"
    }
}

struct Platform: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let abbreviation: String
    
    static func == (lhs: Platform, rhs: Platform) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, abbreviation
    }
}
