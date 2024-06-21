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

struct PokemonTypeViewModel {
    
    let name: PokemonTypeName
    
    var color: Color {
        switch name {
        case .unknown:
            Theme.Color.PokemonType.typeUnknown
        case .normal:
            Theme.Color.PokemonType.typeNormal
        case .grass:
            Theme.Color.PokemonType.typeGrass
        case .poison:
            Theme.Color.PokemonType.typePoison
        case .fire:
            Theme.Color.PokemonType.typeFire
        case .psychic:
            Theme.Color.PokemonType.typePsychic
        case .flying:
            Theme.Color.PokemonType.typeFlying
        case .ice:
            Theme.Color.PokemonType.typeIce
        case .bug:
            Theme.Color.PokemonType.typeBug
        case .rock:
            Theme.Color.PokemonType.typeRock
        case .water:
            Theme.Color.PokemonType.typeWater
        case .electric:
            Theme.Color.PokemonType.typeElectric
        case .ground:
            Theme.Color.PokemonType.typeGround
        case .fairy:
            Theme.Color.PokemonType.typeFairy
        case .steel:
            Theme.Color.PokemonType.typeSteel
        case .fighting:
            Theme.Color.PokemonType.typeFighting
        case .dragon:
            Theme.Color.PokemonType.typeDragon
        case .ghost:
            Theme.Color.PokemonType.typeGhost
        case .dark:
            Theme.Color.PokemonType.typeDark
        case .stellar:
            Theme.Color.PokemonType.typeStellar
        }
    }
}

struct PokemonStatViewModel {
    
    let name: String
    let value: Int
    
    var formatedName: String {
        name.replacingOccurrences(of: "-", with: " ").capitalized
    }
    
    var abbreviatedName: String {
        PokemonStatType(rawValue: name)?.abbreviation ?? "???"
    }
}

enum PokemonStatType: String {
    case hp
    case attack
    case defense
    case specialAttack = "special-attack"
    case specialDefense = "special-defense"
    case speed
    
    var abbreviation: String {
        switch self {
        case .hp:
            return "HP"
        case .attack:
            return "Atk"
        case .defense:
            return "Def"
        case .specialAttack:
            return "SpA"
        case .specialDefense:
            return "SpD"
        case .speed:
            return "Spe"
        }
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
