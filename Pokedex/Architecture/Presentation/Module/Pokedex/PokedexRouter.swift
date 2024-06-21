//
//  PokedexRouter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import UIKit

protocol PokedexRouter {
    func navigateToPokemonDetail(number: Int, delegate: PokemonDetailDelegate)
}

final class PokedexRouterDefault {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension PokedexRouterDefault: PokedexRouter {
    
    func navigateToPokemonDetail(number: Int, delegate: PokemonDetailDelegate) {
        guard let navigationController else {
            return
        }
        let viewController = PokemonDetailConfigurator(navigationController: navigationController).viewController(pokemonNumber: number, delegate: delegate)
        navigationController.pushViewController(viewController, animated: true)
    }
}
