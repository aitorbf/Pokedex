//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import Foundation

struct PokemonDetailViewModel {
    
    let pokemon: PokemonDetailCardViewModel
}

extension PokemonDetailViewModel {
    
    static func empty() -> Self {
        .init(pokemon: .empty())
    }
    
    static func mock() -> Self {
        .init(pokemon: .mock())
    }
}
