//
//  SetPokemonCatchedInteractor.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 19/6/24.
//

import Foundation

// sourcery: AutoMockable
protocol SetPokemonCatchedInteractor {
    func execute(_ catched: Bool, number: Int)
}

final class SetPokemonCatchedInteractorDefault {

    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
}

extension SetPokemonCatchedInteractorDefault: SetPokemonCatchedInteractor {

    func execute(_ catched: Bool, number: Int) {
        if catched {
            repository.markPokemonAsCatched(number)
        } else {
            repository.unmarkPokemonAsCatched(number)
        }
    }
}
