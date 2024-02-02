//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 2/2/24.
//

import Combine

protocol PokemonRepository {
    func getPokemonList(region: PokemonRegion) -> AnyPublisher<PokemonListEntity, DataError>
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError>
}

final class PokemonRepositoryDefault {

    private let remote: PokemonRemoteDataSource
    
    init(remoteDataSource: PokemonRemoteDataSource) {
        remote = remoteDataSource
    }
}

extension PokemonRepositoryDefault: PokemonRepository {
    
    func getPokemonList(region: PokemonRegion) -> AnyPublisher<PokemonListEntity, DataError> {
        remote.getPokemonList(region: region)
    }
    
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        remote.getPokemonDetail(id: id)
    }
}
