//
//  MainConfigurator.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import UIKit

struct MainConfigurator {
    
    static var initialViewController: UINavigationController {
        homeScreen()
    }
}

private extension MainConfigurator {
    
    static func homeScreen() -> UINavigationController {
        let navController = UINavigationController()
        let viewController = PokedexConfigurator(navigationController: navController).viewController()
        navController.viewControllers = [viewController]
        
        return navController
    }
}
