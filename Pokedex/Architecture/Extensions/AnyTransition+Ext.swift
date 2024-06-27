//
//  AnyTransition+Ext.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 22/6/24.
//

import SwiftUI

extension AnyTransition {
    static var scaleAndFade: AnyTransition {
        AnyTransition.scale(scale: 0).combined(with: .opacity)
    }
}
