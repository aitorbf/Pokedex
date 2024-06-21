//
//  CatchedPokemonLocalDataSource.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 18/6/24.
//

import Foundation
import Combine

protocol CatchedPokemonLocalDataSource {
    func catchedPokemons() -> [Int]
    func isPokemonCatched(_ number: Int) -> Bool
    func saveCatchedPokemon(_ number: Int)
    func deleteCatchedPokemon(_ number: Int)
    
}

final class CatchedPokemonLocalDataSourceDefault: CatchedPokemonLocalDataSource {
    
    private let databaseManager: DatabaseManager
    
    init(databaseManager: DatabaseManager) {
        self.databaseManager = databaseManager
    }
    
    func catchedPokemons() -> [Int] {
        guard let viewContext = databaseManager.container?.viewContext else {
            return []
        }
        let catchedPokemons = CatchedPokemonEntityCache.fetchCatchedPokemons(using: viewContext)
        return catchedPokemons.map { Int($0.number) }
    }
    
    func isPokemonCatched(_ number: Int) -> Bool {
        guard let viewContext = databaseManager.container?.viewContext else {
            return false
        }
        return CatchedPokemonEntityCache.fetchCatchedPokemon(withNumber: number, using: viewContext) != nil
    }
    
    func saveCatchedPokemon(_ number: Int) {
        databaseManager.container?.performBackgroundTask { backgroundContext in
            CatchedPokemonEntityCache.saveCatchedPokemon(number, using: backgroundContext)
        }
    }
    
    func deleteCatchedPokemon(_ number: Int) {
        databaseManager.container?.performBackgroundTask { backgroundContext in
            CatchedPokemonEntityCache.deleteCatchedPokemon(withNumber: number, using: backgroundContext)
        }
    }
}
