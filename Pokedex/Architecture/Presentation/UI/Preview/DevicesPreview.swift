//
//  DevicesPreview.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI

struct DevicesPreview<Content>: View where Content: View {
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (Light)")
            .preferredColorScheme(.light)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
            .previewDisplayName("iPhone 15 Pro (Light)")
            .preferredColorScheme(.light)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro Max"))
            .previewDisplayName("iPhone 15 Pro Max (Light)")
            .preferredColorScheme(.light)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (Dark)")
            .preferredColorScheme(.dark)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
            .previewDisplayName("iPhone 15 Pro (Dark)")
            .preferredColorScheme(.dark)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro Max"))
            .previewDisplayName("iPhone 15 Pro Max (Dark)")
            .preferredColorScheme(.dark)
    }
}
