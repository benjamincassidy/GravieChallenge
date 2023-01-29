//
//  SearchView.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject
    var viewModel: SearchViewModel
    
    @State var selectedItem: SearchResultItem?
    @State private var showDetails = false
    
    var body: some View {
        VStack(
            alignment: .leading
        ) {
            TextField(
                Localizations.SearchView.searchForGame,
                text: $viewModel.searchText
            )
            .textFieldStyle(.roundedBorder)
            .showClearButton(text: $viewModel.searchText)
            
            if !viewModel.searchResults.isEmpty {
                Text("SearchResults")
                List(viewModel.searchResults) { searchResultItem in
                    SearchResultItemView(searchResultItem: searchResultItem)
                        .listRowInsets(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            self.selectedItem = searchResultItem
                            print("Tapped: \(searchResultItem)")
                        }
                }
                .frame(maxWidth: .infinity)
                .listStyle(.plain)
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .sheet(item: $selectedItem) {
            SearchItemDetailsView(searchResultItem: $0, viewModel: viewModel)
        }
    }
}
