//
//  AnimatedImage.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 21/6/24.
//

import SwiftUI
import Kingfisher

struct AnimatedImage: UIViewRepresentable {
    
    var resource: Resource?

    func makeUIView(context: Context) -> AnimatedImageView {
        return AnimatedImageView()
    }
    
    func updateUIView(_ uiView: AnimatedImageView, context: Context) {
        uiView.kf.setImage(with: resource)
    }
    
}
