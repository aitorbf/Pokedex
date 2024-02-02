//
//  PokemonRemoteDataSource.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 30/1/24.
//

import Foundation
import Combine

protocol PokemonRemoteDataSource {
    func getPokemonList(region: PokemonRegion) -> AnyPublisher<PokemonListEntity, DataError>
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError>
}

final class PokemonRemoteDataSourceDefault: PokemonRemoteDataSource {
    
    func getPokemonList(region: PokemonRegion) -> AnyPublisher<PokemonListEntity, DataError> {
        let request = GetPokemonListRequest(region: region)
        guard let request = API.Pokemon.PokeAPI.list(request: request).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
    
    func getPokemonDetail(id: String) -> AnyPublisher<PokemonDetailEntity, DataError> {
        guard let request = API.Pokemon.PokeAPI.detail(id: id).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
}
