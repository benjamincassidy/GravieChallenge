//
//  SearchItemDetailsView.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import SwiftUI

struct SearchItemDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let searchResultItem: SearchResultItem
    let viewModel: SearchViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(searchResultItem.name)
                .font(.system(size: 24))
                .fontWeight(.bold)
            AsyncImage(url: URL(string: searchResultItem.image.mediumUrl)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                
            }
            .frame(width: 300, height: 300, alignment: .center)
            if let description = searchResultItem.description?.toHtmlAttributedString() {
                ScrollView {
                    Text(description)
                        .frame(maxHeight: .infinity)
                        .padding(.horizontal, 16)
                }
            }
            if let platforms = searchResultItem.platforms {
                Text("Rent a copy")
                VStack {
                    ForEach(platforms) { platform in
                        Button(action: {
                            viewModel.selectItem(item: searchResultItem, onPlatform: platform)
                            dismiss()
                        }, label: {
                            Text(platform.name)
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(.bordered)
                    }
                }
                .padding(.horizontal, 24)
            } else {
                Text("Sorry, this title is not available to rent")
            }
            Spacer()
        }
        .padding(.top, 16)
    }
}
