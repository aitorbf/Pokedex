//
//  RegionSelector.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct RegionPicker: View {
    
    @Binding var selectedOptionIndex: Int
    
    private let minBackgroundOpacity: CGFloat = 0.01
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Theme.Spacing.space_1) {
                ForEach(Array(PokemonRegion.allCases.enumerated()), id: \.0) { index, region in
                    regionButton(value: region.rawValue, index: index)
                }
            }
            .padding(.vertical, Theme.Spacing.space_0_25)
        }
    }
    
    func regionButton(value: String, index: Int) -> some View {
        ZStack {
            Capsule()
                .foregroundColor(Theme.Color.pokemonRed.opacity(selectedOptionIndex == index ? 1 : minBackgroundOpacity))
                .overlay(
                    Capsule()
                        .stroke(selectedOptionIndex == index ? Theme.Color.onPrimary : Theme.Color.primary, lineWidth: 1)
                )
            Text(value)
                .font(Theme.Font.button)
                .foregroundColor(selectedOptionIndex == index ? Theme.Color.onPrimary : Theme.Color.primary)
                .padding(.horizontal, Theme.Spacing.space_2)
                .padding(.vertical, Theme.Spacing.space_1_5)
        }
        .fixedSize()
        .onTapGesture {
            selectedOptionIndex = index
        }
    }
}

struct RegionPicker_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                RegionPicker(selectedOptionIndex: .constant(0))
            }
        }
    }
}
