//
//  PokemonRow.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI

enum RowContentPosition {
    case leading
    case trailing
}

struct PokemonRow: View {
    
    @Binding var viewModel: PokemonRowViewModel
    let contentPosition: RowContentPosition
    let catchPokemon: (Int) -> Void
    let showPokemonDetail: (Int) -> Void
    
    private let rowSizeHeight: CGFloat = 76
    private let pokemonImageSize: CGFloat = 100
    private let catchedPokeballImageSize: CGFloat = 60
    private let backgroundImageSize: CGFloat = 150
    private let leadingBackgroundImageXOffset: CGFloat = 35
    private let trailingBackgroundImageXOffset: CGFloat = -35
    private let backgroundImageYOffset: CGFloat = 15
    private let backgroundImageOpacity: CGFloat = 0.03
    
    @State private var isAnimatingPokeball = false
    
    var body: some View {
        ZStack {
            background
            content
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            HapticManager.triggerMediumImpact()
            showPokemonDetail(viewModel.number)
        }
    }
    
    var background: some View {
        Rectangle()
            .foregroundColor(Theme.Color.onPrimary)
            .overlay {
                backgroundImage
            }
            .frame(height: rowSizeHeight)
            .cornerRadius(Theme.Radius.medium)
    }
    
    var backgroundImage: some View {
        HStack {
            if contentPosition == .leading {
                Spacer()
            }
            Image(Assets.images.emptyPokeball)
                .resizable()
                .frame(width: backgroundImageSize, height: backgroundImageSize)
                .offset(
                    x: contentPosition == .leading ? leadingBackgroundImageXOffset : trailingBackgroundImageXOffset,
                    y: backgroundImageYOffset
                )
                .opacity(backgroundImageOpacity)
            if contentPosition == .trailing {
                Spacer()
            }
        }
    }
    
    var content: some View {
        HStack(spacing: Theme.Spacing.space_1) {
            switch contentPosition {
            case .leading:
                number
                picture
                name
                Spacer()
            case .trailing:
                Spacer()
                name
                picture
                number
            }
        }
        .frame(height: rowSizeHeight)
        .padding(.horizontal, Theme.Spacing.space_1)
    }
    
    var number: some View {
        ZStack {
            Image(viewModel.isCatched ? Assets.images.pokeball : Assets.images.emptyPokeball)
                .resizable()
                .frame(width: catchedPokeballImageSize, height: catchedPokeballImageSize)
            Text(viewModel.formatedNumber)
                .font(Theme.Font.caption1)
                .foregroundColor(Theme.Color.background)
                .padding(Theme.Spacing.space_0_5)
                .background {
                    Circle()
                        .fill(Theme.Color.primary)
                }
        }
        .rotationEffect(.degrees(isAnimatingPokeball ? (viewModel.isCatched ? 360 : -360) : 0))
        .scaleEffect(isAnimatingPokeball ? (viewModel.isCatched ? 1.5 : 0.5) : 1)
        .animation(Animation.linear, value: isAnimatingPokeball)
        .onTapGesture {
            withAnimation {
                isAnimatingPokeball = true
                catchPokemon(viewModel.number)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimatingPokeball = false
            }
        }
    }
    
    var picture: some View {
        Image.cachedURL(URL(string: viewModel.imageUrl))
            .placeholder {
                Image(Assets.images.unknownPokemon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: pokemonImageSize, height: pokemonImageSize)
            }
            .resizable()
            .scaledToFit()
            .frame(width: pokemonImageSize, height: pokemonImageSize)
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.body1)
            .foregroundColor(Theme.Color.primary)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                VStack(spacing: Theme.Spacing.space_3) {
                    PokemonRow(
                        viewModel: .constant(.mockCatched()),
                        contentPosition: .leading,
                        catchPokemon: { _ in
                            // Intentionally empty
                        },
                        showPokemonDetail: { _ in
                            // Intentionally empty
                        }
                    )
                    PokemonRow(
                        viewModel: .constant(.mockNotCatched()),
                        contentPosition: .trailing,
                        catchPokemon: { _ in
                            // Intentionally empty
                        },
                        showPokemonDetail: { _ in
                            // Intentionally empty
                        }
                    )
                }
            }
        }
    }
}
