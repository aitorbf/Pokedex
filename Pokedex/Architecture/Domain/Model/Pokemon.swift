//
//  Pokemon.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct Pokemon: Model {
    
    let name: String
    let url: String
}

extension Pokemon {
    
    var number: String {
        url.components(separatedBy: "/")[6]
    }
    
    var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(number).png"
    }
}

extension Pokemon {
    
    static func empty() -> Self {
        .init(
            name: "",
            url: ""
        )
    }
    
    static func mock() -> Self {
        .init(
            name: "mewtwo",
            url: "https://pokeapi.co/api/v2/pokemon/150/"
        )
    }
    
    static func mockList() -> [Self] {
        [
            .init(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
            .init(name: "charizard", url: "https://pokeapi.co/api/v2/pokemon/6/"),
            .init(name: "blastoise", url: "https://pokeapi.co/api/v2/pokemon/9/")
        ]
    }
}
