//
//  TextFieldClearButton.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if !text.isEmpty {
                HStack {
                    Spacer()
                    Button {
                        self.text = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                    }
                    .foregroundColor(.secondary)
                    .padding(.trailing, 4)
                }
            }
        }
    }
}

extension View {
    func showClearButton(text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(text: text))
    }
}
