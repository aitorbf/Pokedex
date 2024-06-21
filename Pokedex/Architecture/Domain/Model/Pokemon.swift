//
//  Pokemon.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct Pokemon: Model {
    
    let number: Int
    let name: String
    let url: String
    let imageUrl: String
    var isCatched: Bool
}

extension Pokemon {
    
    static func empty() -> Self {
        .init(
            number: 0,
            name: "",
            url: "",
            imageUrl: "",
            isCatched: false
        )
    }
    
    static func mock() -> Self {
        .init(
            number: 150,
            name: "mewtwo",
            url: "https://pokeapi.co/api/v2/pokemon/150/",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
            isCatched: true
        )
    }
    
    static func mockList() -> [Self] {
        [
            .init(
                number: 3,
                name: "venusaur",
                url: "https://pokeapi.co/api/v2/pokemon/3/",
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
                isCatched: false
            ),
            .init(
                number: 6,
                name: "charizard",
                url: "https://pokeapi.co/api/v2/pokemon/6/",
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png",
                isCatched: true
            ),
            .init(
                number: 9,
                name: "blastoise",
                url: "https://pokeapi.co/api/v2/pokemon/9/",
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png",
                isCatched: false
            )
        ]
    }
}
