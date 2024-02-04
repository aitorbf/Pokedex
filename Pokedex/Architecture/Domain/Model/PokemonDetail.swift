//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokemonDetail: Model {
    
    let number: Int
    let name: String
    let imageUrl: String
    let types: [PokemonType]
    let height: Float
    let weight: Float
    let stats: [PokemonStat]
}

extension PokemonDetail: Equatable {
    
    static func == (lhs: PokemonDetail, rhs: PokemonDetail) -> Bool {
        lhs.number == rhs.number
    }
}

extension PokemonDetail {
    
    var isEmpty: Bool {
        number == 0
    }
}

extension PokemonDetail {
    
    static func empty() -> PokemonDetail {
        .init(
            number: 0,
            name: "",
            imageUrl: "",
            types: [],
            height: 0,
            weight: 0,
            stats: []
        )
    }
    
    static func mock() -> PokemonDetail {
        .init(
            number: 150,
            name: "mewtwo",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
            types: [.init(name: .psychic, url: "https://pokeapi.co/api/v2/type/14/")],
            height: 20,
            weight: 1220,
            stats: [
                .init(name: "hp", value: 106),
                .init(name: "attack", value: 110),
                .init(name: "defense", value: 90),
                .init(name: "special-attack", value: 154),
                .init(name: "special-defense", value: 90),
                .init(name: "speed", value: 130)
            ]
        )
    }
}
