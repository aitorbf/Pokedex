//
//  GetPokedexInteractor.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Combine

protocol GetPokedexInteractor {
    func execute(region: PokemonRegion) -> AnyPublisher<[Pokemon], GetPokedexError>
}

final class GetPokedexInteractorDefault {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
}

extension GetPokedexInteractorDefault: GetPokedexInteractor {
    
    func execute(region: PokemonRegion) -> AnyPublisher<[Pokemon], GetPokedexError> {
        repository.getPokedex(region: region)
            .map { ($0.pokemonEntries ?? []).map { PokemonMapper.map($0) } }
            .mapError { GetPokedexErrorMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
