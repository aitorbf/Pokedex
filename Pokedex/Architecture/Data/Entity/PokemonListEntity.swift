//
//  PokemonListEntity.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 30/1/24.
//

import Foundation

struct PokemonListEntity: Entity {
    
    let count: Int?
    let results: [PokemonEntity]
}
