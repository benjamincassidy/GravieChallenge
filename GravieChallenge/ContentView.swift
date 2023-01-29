//
//  ContentView.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab: Hashable {
        case search
        case cart
    }
    
    @State
    private var selectedTab: Tab = .search
    
    @StateObject
    var searchViewModel: SearchViewModel
    @StateObject
    var checkoutViewModel: CheckoutViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SearchView(viewModel: searchViewModel)
                .onTapGesture {
                    self.selectedTab = .search
                }
                .tabItem {
                    Label(Localizations.ContentView.Tabs.search,
                          systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            CheckoutView(viewModel: checkoutViewModel)
                .onTapGesture {
                    self.selectedTab = .cart
                }
                .tabItem {
                    Label(Localizations.ContentView.Tabs.checkout,
                          systemImage: "cart")
                }
                .badge(checkoutViewModel.count)
                .tag(Tab.cart)
        }
    }
}
