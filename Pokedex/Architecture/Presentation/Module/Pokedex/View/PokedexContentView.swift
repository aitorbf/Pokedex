//
//  PokedexContentView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI

struct PokedexContentView<Presenter: PokedexPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    @State private var scrollTopId = UUID()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { proxy in
                Spacer()
                    .frame(height: Theme.Spacing.space_1)
                    .id(scrollTopId)
                LazyVStack(spacing: Theme.Spacing.space_3) {
                    ForEach(Array($presenter.pokemonList.pokemonRows.enumerated()), id: \.element.id) { index, $pokemon in
                        PokemonRow(
                            viewModel: $pokemon,
                            contentPosition: index % 2 == 0 ? .leading : .trailing,
                            catchPokemon: presenter.didCatchPokemon,
                            showPokemonDetail: presenter.showPokemonDetail
                        )
                        .id(pokemon.id)
                    }
                }
                .padding([.leading, .trailing, .bottom], Theme.Spacing.space_2)
                .onChange(of: presenter.selectedRegionIndex) { _ in
                    presenter.loadPokedex {
                        withAnimation {
                            proxy.scrollTo(scrollTopId, anchor: .top)
                        }
                    }
                }
            }
        }
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
