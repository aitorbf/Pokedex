//
//  PokedexRouter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

protocol PokedexRouter {
    
}

final class PokedexRouterDefault {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension PokedexRouterDefault: PokedexRouter {
    
}
