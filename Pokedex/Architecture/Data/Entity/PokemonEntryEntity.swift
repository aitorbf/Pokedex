//
//  PokemonEntryEntity.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 2/2/24.
//

import Foundation

struct PokemonEntryEntity: Entity {
    
    let number: Int?
    let pokemon: PokemonEntity?
}

extension PokemonEntryEntity {
    
    enum CodingKeys: String, CodingKey {
        case number = "entry_number"
        case pokemon = "pokemon_species"
    }
}
