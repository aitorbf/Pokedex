//
//  View+Ext.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

extension View {
    
    func isLoading(_ loading: Bool) -> some View {
        environment(\.isLoading, loading)
    }
}
