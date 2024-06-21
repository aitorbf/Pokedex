//
//  PokemonRowViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

struct PokemonRowViewModel: Equatable {
    
    let number: Int
    let name: String
    let imageUrl: String
    var isCatched: Bool
    
    var formatedNumber: String {
        String(format: "%03d", number)
    }
}

extension PokemonRowViewModel {
    
    static func mockCatched() -> Self {
        .init(
            number: 150,
            name: "Mewtwo",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
            isCatched: true
        )
    }
    
    static func mockNotCatched() -> Self {
        .init(
            number: 151,
            name: "Mew",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png",
            isCatched: false
        )
    }
}
