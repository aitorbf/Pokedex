//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 2/2/24.
//

import Combine

protocol PokemonRepository {
    func getPokedex(region: PokemonRegion) -> AnyPublisher<PokedexEntity, DataError>
    func getPokemonDetail(number: Int) -> AnyPublisher<PokemonDetailEntity, DataError>
    func markPokemonAsCatched(_ number: Int)
    func unmarkPokemonAsCatched(_ number: Int)
}

final class PokemonRepositoryDefault {

    private let remote: PokemonRemoteDataSource
    private let local: CatchedPokemonLocalDataSource
    
    init(
        remoteDataSource: PokemonRemoteDataSource,
        localDataSource: CatchedPokemonLocalDataSource
    ) {
        remote = remoteDataSource
        local = localDataSource
    }
}

extension PokemonRepositoryDefault: PokemonRepository {
    
    func getPokedex(region: PokemonRegion) -> AnyPublisher<PokedexEntity, DataError> {
        remote.getPokedex(region: region)
            .map { pokedex -> PokedexEntity in
                let pokemonEntries = pokedex.pokemonEntries ?? []
                let catchedPokemonNumbers = self.local.catchedPokemons()
                let updatedPokemonEntries = pokemonEntries.map { entry in
                    var pokedexEntry = entry
                    let pokemonNumber = self.getPokemonNumberByUrl(entry.pokemon?.url)
                    pokedexEntry.pokemon?.number = pokemonNumber
                    pokedexEntry.pokemon?.isCatched = catchedPokemonNumbers.contains(pokemonNumber)
                    return pokedexEntry
                }
                return PokedexEntity(pokemonEntries: updatedPokemonEntries)
            }
            .eraseToAnyPublisher()
    }
    
    func getPokemonDetail(number: Int) -> AnyPublisher<PokemonDetailEntity, DataError> {
        remote.getPokemonDetail(number: number)
            .map { detail -> PokemonDetailEntity in
                var updatedDetail = detail
                updatedDetail.isCatched = self.local.isPokemonCatched(number)
                return updatedDetail
            }
            .eraseToAnyPublisher()
    }
    
    func markPokemonAsCatched(_ number: Int) {
        local.saveCatchedPokemon(number)
    }
    
    func unmarkPokemonAsCatched(_ number: Int) {
        local.deleteCatchedPokemon(number)
    }
    
    private func getPokemonNumberByUrl(_ url: String?) -> Int {
        guard
            let urlComponents = url?.components(separatedBy: "/"),
            urlComponents.count > 6, let number = Int(urlComponents[6])
        else {
            return 0
        }
        return number
    }
}
