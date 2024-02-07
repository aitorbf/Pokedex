//
//  Loading.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct Loading: View {
    
    @Binding var isShown: Bool
    
    private let scale: CGFloat = 1.5
    
    var body: some View {
        if isShown {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(Theme.Color.primary)
                .scaleEffect(scale)
        }
    }
}

struct FullScreenLoading: View {
    
    @Binding var isShown: Bool
    var scale: CGFloat?
    var progressColor: Color?
    
    private let opacity: CGFloat = 0.5
    
    var body: some View {
        Theme.Color.onPrimary
            .opacity(opacity)
            .ignoresSafeArea()
            .overlay(Loading(isShown: $isShown))
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            Color.clear
                .loading(isShown: .constant(true))
        }
    }
}
