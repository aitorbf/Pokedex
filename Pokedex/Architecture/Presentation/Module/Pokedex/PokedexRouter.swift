//
//  PokedexRouter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

protocol PokedexRouter {
    func navigateToPokemonDetail(id: String)
}

final class PokedexRouterDefault {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension PokedexRouterDefault: PokedexRouter {
    
    func navigateToPokemonDetail(id: String) {
        guard let navigationController else {
            return
        }
        let viewController = PokemonDetailConfigurator(navigationController: navigationController).viewController(pokemonNumber: id)
        navigationController.pushViewController(viewController, animated: true)
    }
}
