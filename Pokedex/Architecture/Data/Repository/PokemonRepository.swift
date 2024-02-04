//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 2/2/24.
//

import Combine

protocol PokemonRepository {
    func getPokedex(region: PokemonRegion) -> AnyPublisher<PokedexEntity, DataError>
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError>
}

final class PokemonRepositoryDefault {

    private let remote: PokemonRemoteDataSource
    
    init(remoteDataSource: PokemonRemoteDataSource) {
        remote = remoteDataSource
    }
}

extension PokemonRepositoryDefault: PokemonRepository {
    
    func getPokedex(region: PokemonRegion) -> AnyPublisher<PokedexEntity, DataError> {
        remote.getPokedex(region: region)
    }
    
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        remote.getPokemonDetail(id: id)
    }
}
