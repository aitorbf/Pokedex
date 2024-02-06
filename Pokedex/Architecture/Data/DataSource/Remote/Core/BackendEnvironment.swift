//
//  BackendEnvironment.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 28/1/24.
//

import Foundation

enum BackendEnvironment: String {
    
    case pro
    case dev
    case pre
    
    var apiUrl: String {
        switch self {
        case .pro:
            return "https://pokeapi.co/"
        case .dev:
            return "https://pokeapi.co/"
        case .pre:
            return "https://pokeapi.co/"
        }
    }
}
