//
//  PokemonType.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokemonType: Model {
    
    let name: PokemonTypeName
}

enum PokemonTypeName: String, CaseIterable {
    case unknown
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
    
    func localized() -> String {
        switch self {
        case .unknown:
            Strings.pokemonTypeUnknown
        case .normal:
            Strings.pokemonTypeNormal
        case .grass:
            Strings.pokemonTypeGrass
        case .poison:
            Strings.pokemonTypePoison
        case .fire:
            Strings.pokemonTypeFire
        case .psychic:
            Strings.pokemonTypePsychic
        case .flying:
            Strings.pokemonTypeFlying
        case .ice:
            Strings.pokemonTypeIce
        case .bug:
            Strings.pokemonTypeBug
        case .rock:
            Strings.pokemonTypeRock
        case .water:
            Strings.pokemonTypeWater
        case .electric:
            Strings.pokemonTypeElectric
        case .ground:
            Strings.pokemonTypeGround
        case .fairy:
            Strings.pokemonTypeFairy
        case .steel:
            Strings.pokemonTypeSteel
        case .fighting:
            Strings.pokemonTypeFighting
        case .dragon:
            Strings.pokemonTypeDragon
        case .ghost:
            Strings.pokemonTypeGhost
        case .dark:
            Strings.pokemonTypeDark
        case .stellar:
            Strings.pokemonTypeStellar
        }
    }
}
