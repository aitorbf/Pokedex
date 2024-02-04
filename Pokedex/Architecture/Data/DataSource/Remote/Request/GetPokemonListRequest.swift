//
//  GetPokemonListRequest.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 28/1/24.
//

import Foundation

struct GetPokemonListRequest: Entity {
    
    let pokedexNumber: String
    
    init(region: PokemonRegion) {
        switch region {
        case .national:
            pokedexNumber = "1"
        case .kanto:
            pokedexNumber = "2"
        case .johto:
            pokedexNumber = "3"
        case .hoenn:
            pokedexNumber = "4"
        case .sinnoh:
            pokedexNumber = "5"
        case .unova:
            pokedexNumber = "8"
        case .kalos:
            pokedexNumber = "12"
        case .alola:
            pokedexNumber = "16"
        case .galar:
            pokedexNumber = "27"
        case .paldea:
            pokedexNumber = "31"
        }
    }
}
