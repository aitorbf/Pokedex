//
//  GetPokemonDetailInteractor.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Combine

protocol GetPokemonDetailInteractor {
    func execute(number: Int) -> AnyPublisher<PokemonDetail, GetPokemonDetailError>
}

final class GetPokemonDetailInteractorDefault {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
}

extension GetPokemonDetailInteractorDefault: GetPokemonDetailInteractor {
    
    func execute(number: Int) -> AnyPublisher<PokemonDetail, GetPokemonDetailError> {
        repository.getPokemonDetail(number: number)
            .map { PokemonDetailMapper.map($0) }
            .mapError { GetPokemonDetailErrorMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
