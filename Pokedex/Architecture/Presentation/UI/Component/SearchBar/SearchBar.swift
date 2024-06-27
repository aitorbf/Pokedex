//
//  SearchBar.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 22/6/24.
//

import SwiftUI

struct SearchBar: View {
    
    let placeholder: String
    @Binding var text: String
    
    @FocusState private var focused: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .font(Theme.Font.headline3)
                    .foregroundColor(Theme.Color.neutral30)
                    .padding(.leading, Theme.SearchBar.textFieldLeadingPadding)
            }
            
            TextField("", text: $text)
                .font(Theme.Font.headline3)
                .foregroundColor(Theme.Color.neutral30)
                .tint(Theme.Color.pokemonRed)
                .autocorrectionDisabled()
                .padding(.vertical, Theme.SearchBar.textFieldVerticalPadding)
                .padding(.leading, Theme.SearchBar.textFieldLeadingPadding)
                .padding(.trailing, Theme.SearchBar.textFieldTrailingPadding)
                .overlay(
                    HStack(spacing: 0) {
                        Image(Assets.icon.magnifyingGlassIcon)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Theme.Color.onBackground)
                            .frame(width: Theme.SearchBar.magnifyingGlassSize, height: Theme.SearchBar.magnifyingGlassSize, alignment: .leading)
                            .padding(.leading, Theme.SearchBar.magnifyingGlassPadding)
                        Spacer()
                        if focused {
                            Button {
                                text = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, Theme.SearchBar.cancelImagePadding)
                            }
                        }
                    }
                )
                .onTapGesture {
                    focused = true
                }
                .focused($focused)
        }
        .background(focused ? Theme.Color.neutral90 : Theme.Color.surfaceVariant)
        .cornerRadius(Theme.Radius.extraLarge)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(
            placeholder: "Search...",
            text: .constant("")
        )
    }
}
