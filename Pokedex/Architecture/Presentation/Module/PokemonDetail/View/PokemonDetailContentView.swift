//
//  PokemonDetailContentView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI
import DDSpiderChart

extension AnyTransition {
    static var scaleAndFade: AnyTransition {
        AnyTransition.scale(scale: 0).combined(with: .opacity)
    }
}

struct PokemonDetailContentView<Presenter: PokemonDetailPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    private let pokemonImageSize: CGFloat = 250
    private let catchedPokeballImageSize: CGFloat = 50
    private let pokemonStatsChartWidth: CGFloat = 350
    private let pokemonStatsChartHeight: CGFloat = 300
    private let backgroundImageSize: CGFloat = 400
    private let backgroundImageOpacity: CGFloat = 0.6
    private let backgroundOpacity: CGFloat = 0.7
    private let maxStatValue: Int = 255
    
    @State private var isAnimatingPokeball = false
    @State private var showAnimatedPokemon = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: .zero) {
                name
                number
                ZStack(alignment: .top) {
                    backgroundImage
                    pokemonInfo
                        .padding(.top, pokemonImageSize)
                    pokemonImage
                        .padding(.top, Theme.Spacing.space_4)
                        .onTapGesture {
                            withAnimation {
                                showAnimatedPokemon.toggle()
                            }
                        }
                }
            }
        }
        .background(presenter.pokemonDetail.backgroundColor.opacity(backgroundOpacity))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var name: some View {
        Text(presenter.pokemonDetail.name.firstUppercased)
            .font(Theme.Font.headline1)
            .foregroundColor(Theme.Color.primary)
    }
    
    var number: some View {
        Text(presenter.pokemonDetail.formatedNumber)
            .font(Theme.Font.headline0)
            .foregroundColor(Theme.Color.onPrimary)
    }
    
    var backgroundImage: some View {
        Image(Assets.images.emptyPokeball)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Theme.Color.onPrimary)
            .frame(width: backgroundImageSize, height: backgroundImageSize)
            .opacity(backgroundImageOpacity)
    }
    
    @ViewBuilder
    var pokemonImage: some View {
        if showAnimatedPokemon && !presenter.pokemonDetail.animatedImageUrl.isEmpty {
            AnimatedImage(resource: URL(string: presenter.pokemonDetail.animatedImageUrl))
                .scaledToFit()
                .frame(width: pokemonImageSize, height: pokemonImageSize)
                .transition(.scaleAndFade)
        } else {
            Image.cachedURL(URL(string: presenter.pokemonDetail.imageUrl))
                .placeholder {
                    Image(Assets.images.unknownPokemon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: pokemonImageSize, height: pokemonImageSize)
                }
                .resizable()
                .scaledToFit()
                .frame(width: pokemonImageSize, height: pokemonImageSize)
                .transition(.scaleAndFade)
        }
    }
    
    var pokemonInfo: some View {
        VStack(spacing: Theme.Spacing.space_3) {
            pokemonTypes
            pokemonSize
            pokemonStats
        }
        .padding(.top, showAnimatedPokemon ? Theme.Spacing.space_6 : Theme.Spacing.space_4)
        .padding(.bottom, Theme.Spacing.space_4)
        .background(
            Rectangle()
                .foregroundColor(Theme.Color.onPrimary)
                .cornerRadius(Theme.Radius.large)
        )
    }
    
    var pokemonTypes: some View {
        HStack {
            ForEach(presenter.pokemonDetail.types, id: \.name) { type in
                PokemonTypeBadge(viewModel: .init(typeName: type.name))
            }
        }
    }
    
    var pokemonSize: some View {
        HStack(alignment: .center, spacing: Theme.Spacing.space_4) {
            Spacer()
            VStack {
                Text(String(presenter.pokemonDetail.weight))
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.primary)
                Text(Strings.pokemonDetailWeight)
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.neutral40)
            }
            Image(presenter.pokemonDetail.isCatched ? Assets.images.pokeball : Assets.images.emptyPokeball)
                .resizable()
                .frame(width: catchedPokeballImageSize, height: catchedPokeballImageSize)
                .rotationEffect(.degrees(isAnimatingPokeball ? (presenter.pokemonDetail.isCatched ? 360 : -360) : 0))
                .scaleEffect(isAnimatingPokeball ? (presenter.pokemonDetail.isCatched ? 1.5 : 0.5) : 1)
                .animation(Animation.linear, value: isAnimatingPokeball)
                .onTapGesture {
                    withAnimation {
                        isAnimatingPokeball = true
                        presenter.didCatchPokemon()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isAnimatingPokeball = false
                    }
                }
            VStack {
                Text(String(presenter.pokemonDetail.height))
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.primary)
                Text(Strings.pokemonDetailHeight)
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.neutral40)
            }
            Spacer()
        }
    }
    
    var pokemonStats: some View {
        DDSpiderChart(
            axes: presenter.pokemonDetail.stats.map({ $0.abbreviatedName }),
            values: [
                DDSpiderChartEntries(
                    values: presenter.pokemonDetail.stats.map({ Float($0.value) / Float(maxStatValue) }),
                    color: presenter.pokemonDetail.backgroundColor
                )
            ],
            color: Theme.Color.neutral70,
            fontTitle: .systemFont(ofSize: 16),
            textColor: Theme.Color.primary
        )
        .frame(width: pokemonStatsChartWidth, height: pokemonStatsChartHeight)
    }
}

struct PokemonDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter: MockPokemonDetailPresenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        DevicesPreview {
            PokemonDetailContentView<MockPokemonDetailPresenter>()
                .environmentObject(presenter)
        }
    }
}
