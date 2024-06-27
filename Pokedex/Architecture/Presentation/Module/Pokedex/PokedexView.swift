//
//  PokedexView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import SwiftUI

struct PokedexView<Presenter: PokedexPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            Theme.Color.surfaceContainerLow.ignoresSafeArea()
            VStack(spacing: Theme.Spacing.space_2) {
                RegionPicker(selectedOptionIndex: $presenter.selectedRegionIndex)
                searchBar
                switch presenter.screenState {
                case .loading:
                    PokedexSkeletonView()
                case .error:
                    PokedexErrorView<Presenter> {
                        presenter.reload()
                    }
                case .empty:
                    PokedexEmptyView<Presenter>()
                case .content:
                    PokedexContentView<Presenter>()
                }
            }
            .padding(.top, Theme.Spacing.space_2)
        }
        .toolbar(.logo)
    }
    
    var searchBar: some View {
        SearchBar(
            placeholder: Strings.pokedexSearchPlaceholder,
            text: $presenter.searchValue
        )
        .padding(.horizontal, Theme.Spacing.space_1)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = Pokemon.mockList()
        let presenter: MockPokedexPresenter = MockPokedexPresenter(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexView<MockPokedexPresenter>()
                    .environmentObject(presenter)
            }
        }
    }
}
