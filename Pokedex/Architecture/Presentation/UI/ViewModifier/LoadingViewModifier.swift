//
//  LoadingViewModifier.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

extension View {
    
    func loading(isShown: Binding<Bool>) -> some View {
        modifier(LoadingViewModifier(isShown: isShown))
    }
}

struct LoadingViewModifier: ViewModifier {
    
    @Binding var isShown: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isShown {
                    FullScreenLoading(isShown: $isShown)
                }
            }
    }
}
