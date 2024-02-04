//
//  GetPokemonDetailInteractor.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Combine

protocol GetPokemonDetailInteractor {
    func execute(id: String) -> AnyPublisher<PokemonDetail, GetPokemonDetailError>
}

final class GetPokemonDetailInteractorDefault {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
}

extension GetPokemonDetailInteractorDefault: GetPokemonDetailInteractor {
    
    func execute(id: String) -> AnyPublisher<PokemonDetail, GetPokemonDetailError> {
        repository.getPokemonDetail(id: id)
            .map { PokemonDetailMapper.map($0) }
            .mapError { GetPokemonDetailErrorMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
