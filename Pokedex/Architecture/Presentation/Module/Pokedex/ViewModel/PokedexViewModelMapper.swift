//
//  PokedexViewModelMapper.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokedexViewModelMapper {
    
    static func map(_ pokemonList: [Pokemon]) -> PokedexViewModel {
        .init(
            pokemonRows: pokemonList.map {
                .init(
                    number: $0.number,
                    name: $0.name,
                    imageUrl: $0.imageUrl,
                    isCatched: $0.isCatched
                )
            }
        )
    }
}
