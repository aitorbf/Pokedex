//
//  MockPokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import Foundation

final class MockPokemonDetailPresenter: PokemonDetailPresenter {
    
    var screenState: PokemonDetailScreenState = .loading
    var pokemonDetail: PokemonDetailViewModel = .mock()
    
    init(pokemonDetail: PokemonDetailViewModel) {
        self.pokemonDetail = pokemonDetail
    }
    
    func loadPokemonDetail() {
        // Intentionally empty
    }
    
    func reload() {
        // Intentionally empty
    }
    
    func goBack() {
        // Intentionally empty
    }
}
