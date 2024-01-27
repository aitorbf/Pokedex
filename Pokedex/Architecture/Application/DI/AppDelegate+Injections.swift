//
//  AppDelegate+Injections.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import Foundation

extension AppDelegate {
    
    func configureDependencyInjection() {
        _ = PokedexInjectorProvider.shared
            .add(PokedexModule.self)
    }
}
