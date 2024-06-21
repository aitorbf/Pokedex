//
//  PokedexConfigurator.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import SwiftUI

struct PokedexConfigurator {
    
    private let navigationController: UINavigationController
    
    private var injector: Injector {
        PokedexInjectorProvider.shared.injector
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func viewController() -> UIViewController {
        // Router
        let router = PokedexRouterDefault(navigationController: navigationController)
        
        // Presenter
        let getPokedexInteractor = injector.instanceOf(GetPokedexInteractor.self)
        let setPokemonCatchedInteractor = injector.instanceOf(SetPokemonCatchedInteractor.self)
        let presenter = PokedexPresenterDefault(
            getPokedexInteractor: getPokedexInteractor,
            setPokemonCatchedInteractor: setPokemonCatchedInteractor,
            router: router
        )
        
        // View
        let view: some View = PokedexView<PokedexPresenterDefault>().environmentObject(presenter)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}
