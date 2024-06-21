//
//  PokemonDetailViewModelMapper.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import Foundation

struct PokemonDetailViewModelMapper {
    
    static func map(_ pokemonDetail: PokemonDetail) -> PokemonDetailViewModel {
        .init(
            number: pokemonDetail.number,
            name: pokemonDetail.name,
            imageUrl: pokemonDetail.imageUrl,
            animatedImageUrl: pokemonDetail.animatedImageUrl,
            types: mapTypes(pokemonDetail.types),
            height: pokemonDetail.height,
            weight: pokemonDetail.weight,
            stats: mapStats(pokemonDetail.stats),
            isCatched: pokemonDetail.isCatched
        )
    }
}

private extension PokemonDetailViewModelMapper {
    
    static func mapTypes(_ pokemonTypes: [PokemonType]) -> [PokemonTypeViewModel] {
        pokemonTypes.map { PokemonTypeViewModel(name: $0.name) }
    }
    
    static func mapStats(_ pokemonStats: [PokemonStat]) -> [PokemonStatViewModel] {
        pokemonStats.map { PokemonStatViewModel(name: $0.name, value: $0.value) }
    }
}
