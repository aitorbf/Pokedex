//
//  PokemonTypeBadgeViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokemonTypeBadgeViewModel {
    
    let typeName: PokemonTypeName
    
    var formatedTypeName: String {
        typeName.localized().uppercased()
    }
    
    var backgroundColor: Color {
        switch typeName {
        case .unknown:
            Theme.Color.PokemonType.typeUnknown
        case .normal:
            Theme.Color.PokemonType.typeNormal
        case .grass:
            Theme.Color.PokemonType.typeGrass
        case .poison:
            Theme.Color.PokemonType.typePoison
        case .fire:
            Theme.Color.PokemonType.typeFire
        case .psychic:
            Theme.Color.PokemonType.typePsychic
        case .flying:
            Theme.Color.PokemonType.typeFlying
        case .ice:
            Theme.Color.PokemonType.typeIce
        case .bug:
            Theme.Color.PokemonType.typeBug
        case .rock:
            Theme.Color.PokemonType.typeRock
        case .water:
            Theme.Color.PokemonType.typeWater
        case .electric:
            Theme.Color.PokemonType.typeElectric
        case .ground:
            Theme.Color.PokemonType.typeGround
        case .fairy:
            Theme.Color.PokemonType.typeFairy
        case .steel:
            Theme.Color.PokemonType.typeSteel
        case .fighting:
            Theme.Color.PokemonType.typeFighting
        case .dragon:
            Theme.Color.PokemonType.typeDragon
        case .ghost:
            Theme.Color.PokemonType.typeGhost
        case .dark:
            Theme.Color.PokemonType.typeDark
        case .stellar:
            Theme.Color.PokemonType.typeStellar
        }
    }
}
