//
//  PokemonDetailCard.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI
import DDSpiderChart

struct PokemonDetailCard: View {
    
    private let pokemonImageSize: CGFloat = 250
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 300
    private let backgroundImageOpacity: CGFloat = 0.6
    private let backgroundOpacity: CGFloat = 0.7
    private let maxStatValue: Int = 255
    
    let viewModel: PokemonDetailCardViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                name
                number
                    .padding(.bottom, pokemonImageSize)
                ZStack {
                    Rectangle()
                        .foregroundColor(Theme.Color.onPrimary)
                        .cornerRadius(Theme.Radius.large, corners: [.topLeft, .topRight])
                        .ignoresSafeArea()
                    VStack(spacing: .zero) {
                        ZStack {
                            backgroundImage
                            pokemonImage
                        }
                        .padding(.top, -pokemonImageSize)
                        types
                            .padding(.bottom, Theme.Spacing.space_2)
                        stats
                            .padding(.bottom, Theme.Spacing.space_4)
                    }
                    .padding(.top, Theme.Spacing.space_4)
                }
            }
        }
        .background(viewModel.backgroundColor.opacity(backgroundOpacity))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.headline1)
            .foregroundColor(Theme.Color.primary)
    }
    
    var number: some View {
        Text(viewModel.numberFormated)
            .font(Theme.Font.headline0)
            .foregroundColor(Theme.Color.onPrimary)
    }
    
    var backgroundImage: some View {
        Image(Assets.images.pokeball)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Theme.Color.onPrimary)
            .frame(width: backgroundImageSize, height: backgroundImageSize)
            .opacity(backgroundImageOpacity)
    }
    
    var types: some View {
        HStack {
            ForEach(viewModel.types, id: \.name) { type in
                PokemonTypeBadge(viewModel: .init(typeName: type.name))
            }
        }
    }
    
    var stats: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                VStack {
                    Text(String(viewModel.weight))
                        .font(Theme.Font.body1)
                        .foregroundColor(Theme.Color.primary)
                    Text(Strings.pokemonDetailWeight)
                        .font(Theme.Font.body1)
                        .foregroundColor(Theme.Color.neutral40)
                }
                Spacer()
                VStack {
                    Text(String(viewModel.height))
                        .font(Theme.Font.body1)
                        .foregroundColor(Theme.Color.primary)
                    Text(Strings.pokemonDetailHeight)
                        .font(Theme.Font.body1)
                        .foregroundColor(Theme.Color.neutral40)
                }
                Spacer()
            }
            
            DDSpiderChart(
                axes: viewModel.stats.map({ $0.nameFormated }),
                values: [
                    DDSpiderChartEntries(
                        values: viewModel.stats.map({ Float($0.value) / Float(maxStatValue) }),
                        color: viewModel.backgroundColor
                    )
                ],
                color: Theme.Color.neutral70,
                fontTitle: .systemFont(ofSize: 16),
                textColor: Theme.Color.primary
            )
            .frame(width: 350, height: 300)
        }
    }
    
    var pokemonImage: some View {
        Image.cachedURL(URL(string: viewModel.imageURL))
            .placeholder {
                Image(Assets.images.pokeball)
                    .resizable()
                    .opacity(imagePlaceholderOpacity)
                    .frame(width: pokemonImageSize, height: pokemonImageSize)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: pokemonImageSize, height: pokemonImageSize)
    }
}

// swiftlint:disable no_magic_numbers
struct PokemonDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokemonDetailCard(
                    viewModel: .mock()
                )
            }
        }
    }
}
