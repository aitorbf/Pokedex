//
//  PokemonRemoteDataSource.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 30/1/24.
//

import Foundation
import Combine

protocol PokemonRemoteDataSource {
    func getPokedex(region: PokemonRegion) -> AnyPublisher<PokedexEntity, DataError>
    func getPokemonDetail(number: Int) -> AnyPublisher<PokemonDetailEntity, DataError>
}

final class PokemonRemoteDataSourceDefault: PokemonRemoteDataSource {
    
    func getPokedex(region: PokemonRegion) -> AnyPublisher<PokedexEntity, DataError> {
        let request = GetPokedexRequest(region: region)
        guard let request = API.Pokemon.PokeAPI.list(request: request).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
    
    func getPokemonDetail(number: Int) -> AnyPublisher<PokemonDetailEntity, DataError> {
        guard let request = API.Pokemon.PokeAPI.detail(number: number).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
}
