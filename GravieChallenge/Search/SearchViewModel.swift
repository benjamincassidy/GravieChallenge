//
//  SearchViewModel.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import Foundation
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    
    private let cartRepository: CartRepository
    
    @Published var searchText: String = "" {
        didSet {
            performSearch(searchText: searchText)
        }
    }
    
    @Published var searchResults: [SearchResultItem] = []
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func performSearch(searchText: String) {
        let urlString = (baseSearchUrl + searchText).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let urlString, let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                if let results = searchResponse.results {
                    DispatchQueue.main.async {
                        self.searchResults = results
                    }
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func selectItem(item: SearchResultItem, onPlatform platform: Platform) {
        cartRepository.reserve(item: item, onPlatform: platform)
    }
}
