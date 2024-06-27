//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokemonDetailViewModel: Equatable {
    
    let number: Int
    let name: String
    let imageUrl: String
    let animatedImageUrl: String
    let types: [PokemonTypeViewModel]
    let height: Float
    let weight: Float
    let stats: [PokemonStatViewModel]
    var isCatched: Bool
    
    var backgroundColor: Color {
        types.first?.color ?? Theme.Color.PokemonType.typeUnknown
    }
    
    var formatedNumber: String {
        String(format: "%03d", number)
    }
    
    static func == (lhs: PokemonDetailViewModel, rhs: PokemonDetailViewModel) -> Bool {
        lhs.number == rhs.number
    }
}

extension PokemonDetailViewModel {
    
    static func empty() -> Self {
        .init(
            number: 0,
            name: "",
            imageUrl: "",
            animatedImageUrl: "",
            types: [],
            height: 0,
            weight: 0,
            stats: [],
            isCatched: false
        )
    }
    
    static func mock() -> Self {
        .init(
            number: 150,
            name: "Mewtwo",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
            animatedImageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/150.gif",
            types: [.init(name: .psychic)],
            height: 20,
            weight: 1220,
            stats: [
                .init(name: "hp", value: 106),
                .init(name: "attack", value: 110),
                .init(name: "defense", value: 90),
                .init(name: "special-attack", value: 154),
                .init(name: "special-defense", value: 90),
                .init(name: "speed", value: 130)
            ],
            isCatched: true
        )
    }
}
