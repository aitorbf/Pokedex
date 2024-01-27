//
//  NavigationController.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import UIKit

final class NavigationController: UINavigationController {
    
    // iOS 15: Used to always hide the native UINavigationBar when navigating
    override var isNavigationBarHidden: Bool {
        get { true }
        set { super.isNavigationBarHidden = newValue }
    }
}
