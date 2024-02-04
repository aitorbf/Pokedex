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
        configurePokedex(container)
    }
    
    private func configurePokedex(_ container: Container) {
        container.register(PokemonRemoteDataSource.self) { _ in
            PokemonRemoteDataSourceDefault()
        }
        .inObjectScope(.container)
        
        container.register(PokemonRepository.self) { r in
            PokemonRepositoryDefault(
                remoteDataSource: r.resolve(PokemonRemoteDataSource.self)!
            )
        }
        .inObjectScope(.container)
        
        container.register(GetPokedexInteractor.self) { r in
            GetPokedexInteractorDefault(
                repository: r.resolve(PokemonRepository.self)!
            )
        }
        .inObjectScope(.container)
    }
}
