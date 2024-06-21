//
//  PokemonDetailEmptyView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokemonDetailEmptyView: View {
    
    private let iconSize: CGFloat = 32
    private let iconCircleSize: CGFloat = 128
    private let textHorizontalPadding: CGFloat = 80
    
    var body: some View {
        VStack(spacing: Theme.Spacing.space_4) {
            icon
            explanation
        }
    }
    
    var icon: some View {
        ZStack {
            Image(Assets.images.emptyPokeball)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Theme.Color.onPrimary)
                .frame(width: iconCircleSize, height: iconCircleSize)
            Image(Assets.icon.warningIcon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Theme.Color.primary)
                .frame(width: iconSize, height: iconSize)
        }
    }
    
    var explanation: some View {
        Text(Strings.pokemonDetailEmpty)
            .font(Theme.Font.body1)
            .foregroundColor(Theme.Color.onBackground)
            .multilineTextAlignment(.center)
            .padding(.horizontal, textHorizontalPadding)
    }
}

struct PokemonDetailEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokemonDetailEmptyView()
            }
        }
    }
}
