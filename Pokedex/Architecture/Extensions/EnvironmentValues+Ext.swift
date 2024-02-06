//
//  EnvironmentValues+Ext.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct CustomLoadingKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    
    var isLoading: Bool {
        get { self[CustomLoadingKey.self] }
        set { self[CustomLoadingKey.self] = newValue }
    }
}
