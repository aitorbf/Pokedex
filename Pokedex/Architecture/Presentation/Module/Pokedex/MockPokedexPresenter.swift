//
//  MockPokedexPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

final class MockPokedexPresenter: PokedexPresenter {
    
    var screenState: PokedexScreenState = .content
    var pokemonList: PokemonViewModel = .empty()
    
    init(pokemonList: [Pokemon]) {
        self.pokemonList = PokemonViewModelMapper.map(pokemonList)
    }
    
    func loadPokedex() {
        // Intentionally empty
    }
    
    func reload() {
        // Intentionally empty
    }
    
    func loadPokemonDetail(id: String) {
        // Intentionally empty
    }
}
