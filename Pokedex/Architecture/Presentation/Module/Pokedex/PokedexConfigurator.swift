//
//  PokedexConfigurator.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import SwiftUI

struct PokedexConfigurator {
    
    private let navigationController: NavigationController
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func viewController() -> UIViewController {
        
        // View
        let view: some View = PokedexView()
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}
