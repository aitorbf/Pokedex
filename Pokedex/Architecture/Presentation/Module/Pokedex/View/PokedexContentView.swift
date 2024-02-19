//
//  PokedexContentView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI

struct PokedexContentView<Presenter: PokedexPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    @State private var contentID = UUID()
    
    var body: some View {
        VStack(spacing: Theme.Spacing.space_1) {
            RegionPicker(selectedOptionIndex: $presenter.selectedRegionIndex)
            ScrollView(showsIndicators: false) {
                ScrollViewReader { proxy in
                    LazyVStack(spacing: Theme.Spacing.space_3) {
                        ForEach(Array(presenter.pokemonList.pokemon.enumerated()), id: \.element.number) { index, pokemonCardViewModel in
                            PokemonCard(
                                viewModel: pokemonCardViewModel,
                                contentPosition: index % 2 == 0 ? .leading : .trailing,
                                onTap: {
                                    presenter.loadPokemonDetail(id: pokemonCardViewModel.number)
                                }
                            )
                            .id(index)
                        }
                    }
                    .id(contentID)
                    .padding(Theme.Spacing.space_2)
                    .onChange(of: presenter.pokemonList.pokemon) { _ in
                        withAnimation {
                            contentID = UUID()
                            proxy.scrollTo(0, anchor: .top)
                        }
                    }
                }
            }
        }
        .padding(.top, Theme.Spacing.space_2)
        .loading(isShown: $presenter.isLoading)
    }
}

struct PokedexContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = [Pokemon.mock()]
        let presenter: MockPokedexPresenter = MockPokedexPresenter(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexContentView<MockPokedexPresenter>()
                    .environmentObject(presenter)
            }
        }
    }
}
