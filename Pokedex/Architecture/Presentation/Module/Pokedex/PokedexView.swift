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
            switch presenter.screenState {
            case .loading:
                EmptyView()
//                PokedexSkeletonView()
            case .error:
                EmptyView()
//                PokedexErrorView<Presenter>()
            case .empty:
                EmptyView()
//                PokedexEmptyView()
            case .content:
                EmptyView()
                PokedexContentView<Presenter>()
            }
        }
        .toolbar(.logo)
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
