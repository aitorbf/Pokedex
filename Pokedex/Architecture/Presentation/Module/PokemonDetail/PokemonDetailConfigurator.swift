//
//  PokemonDetailConfigurator.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokemonDetailConfigurator {

    private let navigationController: UINavigationController
    
    private var injector: Injector {
        PokedexInjectorProvider.shared.injector
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func viewController(
        pokemonNumber: Int,
        delegate: PokemonDetailDelegate
    ) -> UIViewController {
        // Router
        let router = PokemonDetailRouterDefault(navigationController: navigationController)
        
        // Presenter
        let getPokemonDetailInteractor = injector.instanceOf(GetPokemonDetailInteractor.self)
        let presenter = PokemonDetailPresenterDefault(
            pokemonNumber: pokemonNumber,
            getPokemonDetailInteractor: getPokemonDetailInteractor,
            router: router
        )
        presenter.delegate = delegate
        
        // View
        let view: some View = PokemonDetailView<PokemonDetailPresenterDefault>().environmentObject(presenter)
        let hostingController: UIViewController = HostingController(rootView: view)

        return hostingController
    }
}
