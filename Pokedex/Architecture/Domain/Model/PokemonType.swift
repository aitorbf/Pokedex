//
//  PokemonType.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokemonType: Model {
    
    let name: PokemonTypeName
    let url: String
    
    var id: String {
        url.components(separatedBy: "/")[6]
    }
}

enum PokemonTypeName: String, CaseIterable {
    case none
    case normal
    case grass
    case poison
    case fire
    case psychic
    case flying
    case ice
    case bug
    case rock
    case water
    case electric
    case ground
    case fairy
    case steel
    case fighting
    case dragon
    case ghost
}
