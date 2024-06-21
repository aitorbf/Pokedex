//
//  PokedexModule.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import Foundation
import Swinject

class PokedexModule: InjectorModule {
    
    override func configure(_ container: Container) {
        configurePersistence(container)
        configurePokedex(container)
        configurePokemonDetail(container)
    }
    
    private func configurePersistence(_ container: Container) {
        container.register(DatabaseManager.self) { _ in
            DatabaseManagerDefault()
        }
        .inObjectScope(.container)
    }
    
    private func configurePokedex(_ container: Container) {
        container.register(PokemonRemoteDataSource.self) { _ in
            PokemonRemoteDataSourceDefault()
        }
        .inObjectScope(.container)
        
        container.register(CatchedPokemonLocalDataSource.self) { r in
            CatchedPokemonLocalDataSourceDefault(databaseManager: r.resolve(DatabaseManager.self)!)
        }
        .inObjectScope(.container)
        
        container.register(PokemonRepository.self) { r in
            PokemonRepositoryDefault(
                remoteDataSource: r.resolve(PokemonRemoteDataSource.self)!,
                localDataSource: r.resolve(CatchedPokemonLocalDataSource.self)!
            )
        }
        .inObjectScope(.container)
        
        container.register(GetPokedexInteractor.self) { r in
            GetPokedexInteractorDefault(
                repository: r.resolve(PokemonRepository.self)!
            )
        }
        .inObjectScope(.container)
        
        container.register(SetPokemonCatchedInteractor.self) { r in
            SetPokemonCatchedInteractorDefault(
                repository: r.resolve(PokemonRepository.self)!
            )
        }
        .inObjectScope(.container)
    }
    
    private func configurePokemonDetail(_ container: Container) {
        container.register(GetPokemonDetailInteractor.self) { r in
            GetPokemonDetailInteractorDefault(
                repository: r.resolve(PokemonRepository.self)!
            )
        }
        .inObjectScope(.container)
    }
}
