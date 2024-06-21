//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokedexViewModel {
    
    var pokemonRows: [PokemonRowViewModel]
}

extension PokedexViewModel {
    
    static func empty() -> Self {
        .init(pokemonRows: [])
    }
    
    static func mock() -> Self {
        .init(
            pokemonRows: [
                .mockCatched(),
                .mockNotCatched()
            ]
        )
    }
}
