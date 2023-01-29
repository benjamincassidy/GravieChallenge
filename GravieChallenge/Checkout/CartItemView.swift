//
//  CartItemView.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import SwiftUI

struct CartItemView: View {
    
    let cartItem: CartItem
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cartItem.game.image.thumbUrl)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                
            }.frame(width: 50, height: 50, alignment: .center)
            VStack(alignment: .leading) {
                Text(cartItem.game.name)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                Text(cartItem.platform.name)
                    .font(.system(size: 12))
            }
        }
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(
            cartItem: CartItem(
                platform: Platform(id: 94, name: "PV", abbreviation: "PC"),
                game: SearchResultItem(
                    id: 80640,
                    name: "Final Fantasy XVI",
                    image: ImageData(
                        thumbUrl: "https://www.giantbomb.com/a/uploads/scale_avatar/9/97089/3431181-ps5box.jpg",
                        screenUrl: "https://www.giantbomb.com/a/uploads/screen_medium/9/97089/3431181-ps5box.jpg",
                        mediumUrl: "https://www.giantbomb.com/a/uploads/scale_medium/9/97089/3431181-ps5box.jpg"
                    ),
                    description: "<h2>Overview</h2><blockquote><p>An epic dark fantasy world where the fate of the land is decided by the mighty Eikons and the Dominants who wield them. This is the tale of Clive Rosfield, a warrior granted the title “First Shield of Rosaria” and sworn to protect his younger brother Joshua, the Dominant of the Phoenix. Before long, Clive will be caught up in a great tragedy and swear revenge on the Dark Eikon Ifrit, a mysterious entity that brings calamity in its wake.</p></blockquote><p>--Square Enix</p>",
                    platforms: [Platform(id: 94, name: "PC", abbreviation: "PC")]
                ))
        )
    }
}
