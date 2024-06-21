//
//  MockPokedexPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

final class MockPokedexPresenter: PokedexPresenter {
    
    var screenState: PokedexScreenState = .content
    var pokemonList: PokedexViewModel = .empty()
    var selectedRegionIndex: Int = 0
    var isLoading: Bool = false
    
    init(pokemonList: [Pokemon]) {
        self.pokemonList = PokedexViewModelMapper.map(pokemonList)
    }
    
    func loadPokedex(_ completion: (() -> Void)? = nil) {
        // Intentionally empty
    }
    
    func reload() {
        // Intentionally empty
    }
    
    func didCatchPokemon(number: Int) {
        // Intentionally empty
    }
    
    func showPokemonDetail(number: Int) {
        // Intentionally empty
    }
}
