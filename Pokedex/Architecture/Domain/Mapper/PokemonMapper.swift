//
//  PokemonMapper.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokemonMapper {
    
    static private let imageUrlPath = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    
    static func map(_ entity: PokemonEntryEntity) -> Pokemon {
        let number = entity.pokemon?.number ?? 0
        let imageUrl = "\(imageUrlPath)\(number).png"
        
        return .init(
            number: number,
            name: entity.pokemon?.name ?? "",
            url: entity.pokemon?.url ?? "",
            imageUrl: imageUrl,
            isCatched: entity.pokemon?.isCatched ?? false
        )
    }
}
