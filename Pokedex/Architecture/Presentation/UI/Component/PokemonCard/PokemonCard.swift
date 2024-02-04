//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI

enum CardContentPosition {
    case leading
    case trailing
}

struct PokemonCard: View {
    
    private let avatarSize: CGFloat = 90
    private let rowSizeHeight: CGFloat = 64
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 150
    private let leadingBackgroundImageXOffset: CGFloat = 35
    private let trailingBackgroundImageXOffset: CGFloat = -35
    private let backgroundImageYOffset: CGFloat = 15
    private let backgroundImageOpacity: CGFloat = 0.03
    
    let viewModel: PokemonCardViewModel
    let contentPosition: CardContentPosition
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            background
            content
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            HapticManager.triggerMediumImpact()
            onTap()
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
            Image(Assets.images.pokeball)
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
        HStack(spacing: Theme.Spacing.space_2) {
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
        .padding(.horizontal, Theme.Spacing.space_2)
    }
    
    var number: some View {
        ZStack {
            Circle()
                .fill(Theme.Color.surfaceVariant)
                .padding(.vertical, Theme.Spacing.space_1_5)
            Text(viewModel.number)
                .font(Theme.Font.caption1)
                .foregroundColor(Theme.Color.primary)
        }
    }
    
    var picture: some View {
        Image.cachedURL(URL(string: viewModel.imageURL))
            .placeholder {
                Image(Assets.images.pokeball)
                    .resizable()
                    .opacity(imagePlaceholderOpacity)
                    .frame(width: avatarSize, height: avatarSize)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: avatarSize, height: avatarSize)
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
                    PokemonCard(
                        viewModel: .init(
                            number: "150",
                            name: "Mewtwo",
                            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png"
                        ),
                        contentPosition: .leading,
                        onTap: {
                            // Intentionally empty
                        }
                    )
                    PokemonCard(
                        viewModel: .init(
                            number: "151",
                            name: "Mew",
                            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png"
                        ),
                        contentPosition: .trailing,
                        onTap: {
                            // Intentionally empty
                        }
                    )
                }
            }
        }
    }
}
