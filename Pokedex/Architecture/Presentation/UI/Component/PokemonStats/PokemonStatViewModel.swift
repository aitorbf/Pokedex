//
//  PokemonStatViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 24/6/24.
//

import Foundation

struct PokemonStatViewModel {
    
    let name: String
    let value: Int
    
    var formatedName: String {
        name.replacingOccurrences(of: "-", with: " ").capitalized
    }
    
    var abbreviatedName: String {
        PokemonStatType(rawValue: name)?.abbreviation ?? "???"
    }
}

enum PokemonStatType: String {
    case hp
    case attack
    case defense
    case specialAttack = "special-attack"
    case specialDefense = "special-defense"
    case speed
    
    var abbreviation: String {
        switch self {
        case .hp:
            return "HP"
        case .attack:
            return "Atk"
        case .defense:
            return "Def"
        case .specialAttack:
            return "SpA"
        case .specialDefense:
            return "SpD"
        case .speed:
            return "Spe"
        }
    }
}
