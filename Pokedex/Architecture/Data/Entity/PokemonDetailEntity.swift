//
//  PokemonDetailEntity.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 30/1/24.
//

import Foundation

struct PokemonDetailEntity: Entity {
    
    let id: Int?
    let name: String?
    let sprites: Sprites?
    let types: [PokemonTypesEntity]
    let height: Float?
    let weight: Float?
    let stats: [PokemonStatsEntity]
    var isCatched: Bool?
}

struct Sprites: Entity {
    
    let other: Other
}

struct Other: Entity {
    
    let artwork: Artwork
    let showdown: Showdown
    
    enum CodingKeys: String, CodingKey {
        case artwork = "official-artwork"
        case showdown
    }
}

struct Artwork: Entity {
    
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Showdown: Entity {
    
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonTypesEntity: Entity, Hashable {
    
    let type: PokemonTypeEntity
    
    static func == (lhs: PokemonTypesEntity, rhs: PokemonTypesEntity) -> Bool {
        return lhs.type.name == rhs.type.name
    }
}

struct PokemonTypeEntity: Entity, Hashable {
    
    let name: PokemonTypeNameEntity
    let url: String
}

enum PokemonTypeNameEntity: String, Entity {
    
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
    case dark
    case stellar
}

struct PokemonStatsEntity: Entity {
    
    let value: Int
    let stat: PokemonStatEntity
    
    enum CodingKeys: String, CodingKey {
        case value = "base_stat"
        case stat
    }
}

struct PokemonStatEntity: Entity {
    
    let name: String
}
