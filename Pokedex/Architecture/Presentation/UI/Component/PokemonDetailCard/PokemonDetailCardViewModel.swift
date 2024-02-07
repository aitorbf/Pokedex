//
//  PokemonDetailCardViewModel.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokemonDetailCardViewModel: Equatable {
    
    let number: Int
    let name: String
    let imageURL: String
    let types: [PokemonTypeDetailCardViewModel]
    let height: Float
    let weight: Float
    let stats: [PokemonStatDetailCardViewModel]
    
    var backgroundColor: Color {
        types.first?.color ?? Theme.Color.PokemonType.typeNone
    }
    
    var numberFormated: String {
        String(format: "%03d", number)
    }
    
    static func == (lhs: PokemonDetailCardViewModel, rhs: PokemonDetailCardViewModel) -> Bool {
        lhs.number == rhs.number
    }
}

struct PokemonTypeDetailCardViewModel {
    
    let name: PokemonTypeName
    let url: String
    
    var id: String {
        url.components(separatedBy: "/")[6]
    }
    
    var color: Color {
        switch name {
        case .none:
            return Theme.Color.PokemonType.typeNone
        case .normal:
            return Theme.Color.PokemonType.typeNormal
        case .grass:
            return Theme.Color.PokemonType.typeGrass
        case .poison:
            return Theme.Color.PokemonType.typePoison
        case .fire:
            return Theme.Color.PokemonType.typeFire
        case .psychic:
            return Theme.Color.PokemonType.typePsychic
        case .flying:
            return Theme.Color.PokemonType.typeFlying
        case .ice:
            return Theme.Color.PokemonType.typeIce
        case .bug:
            return Theme.Color.PokemonType.typeBug
        case .rock:
            return Theme.Color.PokemonType.typeRock
        case .water:
            return Theme.Color.PokemonType.typeWater
        case .electric:
            return Theme.Color.PokemonType.typeElectric
        case .ground:
            return Theme.Color.PokemonType.typeGround
        case .fairy:
            return Theme.Color.PokemonType.typeFairy
        case .steel:
            return Theme.Color.PokemonType.typeSteel
        case .fighting:
            return Theme.Color.PokemonType.typeFighting
        case .dragon:
            return Theme.Color.PokemonType.typeDragon
        case .ghost:
            return Theme.Color.PokemonType.typeGhost
        }
    }
}

struct PokemonStatDetailCardViewModel {
    
    let name: String
    let value: Int
    
    var nameFormated: String {
        name.replacingOccurrences(of: "-", with: " ")
    }
}

extension PokemonDetailCardViewModel {
    
    static func empty() -> Self {
        .init(
            number: 0,
            name: "",
            imageURL: "",
            types: [],
            height: 0,
            weight: 0,
            stats: []
        )
    }
    
    static func mock() -> Self {
        .init(
            number: 150,
            name: "Mewtwo",
            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png",
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
