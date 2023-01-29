//
//  CheckoutView.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import SwiftUI

struct CheckoutView: View {
    
    @StateObject
    var viewModel: CheckoutViewModel
    
    var body: some View {
        if (viewModel.count == 0) {
            Text(Localizations.CartView.cartEmptyMessage)
        } else {
            VStack {
                List(viewModel.games) { game in
                    CartItemView(cartItem: game)
                }.background(.white)
                Spacer()
                Button(action: {
                    viewModel.checkout()
                }, label: {
                    Text(Localizations.CartView.checkout)
                        .frame(maxWidth: .infinity)
                })
                .padding(.horizontal, 16)
                .buttonStyle(.bordered)
                .alert(Localizations.CartView.checkout, isPresented: $viewModel.showConfirmationDialog) {
                        HStack {
                            Button(Localizations.cancel, action: { viewModel.cancelCheckout() })
                        Button(Localizations.ok, action: { viewModel.finalizeCheckout() })
                    }
                } message: {
                    Text(Localizations.CartView.checkoutConfirmationMessage)
                }
            }
            .padding(.bottom, 16)
        }
    }
}
