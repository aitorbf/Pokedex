//
//  GetPokemonDetailErrorMapper.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct GetPokemonDetailErrorMapper {
    
    static func map(_ error: DataError) -> GetPokemonDetailError {
        switch error {
        default:
            return .undefined
        }
    }
}
