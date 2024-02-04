//
//  PokedexEntity.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 30/1/24.
//

import Foundation

struct PokedexEntity: Entity {
    
    let pokemonEntries: [PokemonEntryEntity]?
}

extension PokedexEntity {
    
    enum CodingKeys: String, CodingKey {
        case pokemonEntries = "pokemon-entries"
    }
}
