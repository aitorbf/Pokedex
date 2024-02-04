//
//  GetPokedexErrorMapper.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct GetPokedexErrorMapper {
    
    static func map(_ error: DataError) -> GetPokedexError {
        switch error {
        default:
            return .undefined
        }
    }
}
