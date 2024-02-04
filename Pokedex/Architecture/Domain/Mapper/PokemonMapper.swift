//
//  PokemonMapper.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokemonMapper {
    
    static func map(_ entity: PokemonEntryEntity) -> Pokemon {
        .init(
            name: entity.pokemon?.name ?? "",
            url: entity.pokemon?.url ?? ""
        )
    }
}
