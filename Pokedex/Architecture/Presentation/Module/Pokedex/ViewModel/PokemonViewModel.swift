//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokemonViewModel {
    
    let pokemon: [PokemonCardViewModel]
}

extension PokemonViewModel {
    
    static func empty() -> Self {
        .init(pokemon: [])
    }
}
