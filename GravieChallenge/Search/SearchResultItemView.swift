//
//  SearchResultItem.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import SwiftUI

struct SearchResultItemView: View {
    
    let searchResultItem: SearchResultItem
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: searchResultItem.image.thumbUrl)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    
                }
                .frame(width: 50, height: 50, alignment: .center)
                
                VStack(alignment: .leading) {
                    Text(searchResultItem.name)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            Spacer()
                            if let platforms = searchResultItem.platforms {
                                ForEach(platforms, id: \.self) { platform in
                                    Text(platform.abbreviation)
                                        .font(.system(size: 10))
                                        .padding(4)
                                        .background(Color.gray)
                                        .foregroundColor(Color.white)
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                }
            }
            Divider()
        }
        .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
    }
}

struct SearchResultItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultItemView(
            searchResultItem: SearchResultItem(
                id: 80640,
                name: "Final Fantasy XVI",
                image: ImageData(
                    thumbUrl: "https://www.giantbomb.com/a/uploads/scale_avatar/9/97089/3431181-ps5box.jpg",
                    screenUrl: "https://www.giantbomb.com/a/uploads/screen_medium/9/97089/3431181-ps5box.jpg",
                    mediumUrl: "https://www.giantbomb.com/a/uploads/scale_medium/9/97089/3431181-ps5box.jpg"
                ),
                description: "<h2>Overview</h2><blockquote><p>An epic dark fantasy world where the fate of the land is decided by the mighty Eikons and the Dominants who wield them. This is the tale of Clive Rosfield, a warrior granted the title “First Shield of Rosaria” and sworn to protect his younger brother Joshua, the Dominant of the Phoenix. Before long, Clive will be caught up in a great tragedy and swear revenge on the Dark Eikon Ifrit, a mysterious entity that brings calamity in its wake.</p></blockquote><p>--Square Enix</p>",
                platforms: [Platform(id: 94, name: "PC", abbreviation: "PC")]
            )
        )
    }
}
