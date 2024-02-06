//
//  PokemonDetailRouter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import Foundation

protocol PokemonDetailRouter {
    func navigateBack()
}

final class PokemonDetailRouterDefault {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension PokemonDetailRouterDefault: PokemonDetailRouter {
    
    func navigateBack() {
        navigationController?.popViewController(animated: true)
    }
}
