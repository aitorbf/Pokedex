//
//  PokemonTypeBadge.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokemonTypeBadge: View {
    
    let viewModel: PokemonTypeBadgeViewModel
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(viewModel.backgroundColor)
            Text(viewModel.typeNameFormated)
                .font(Theme.Font.caption2)
                .foregroundColor(Theme.Color.onPrimary)
                .padding(.horizontal, Theme.Spacing.space_1)
                .padding(.vertical, Theme.Spacing.space_0_25)
        }
        .fixedSize()
    }
}

struct PokemonTypeBadge_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                VStack {
                    ForEach(PokemonTypeName.allCases, id:\.self) { type in
                        PokemonTypeBadge(
                            viewModel: .init(
                                typeName: type
                            )
                        )
                    }
                }
            }
        }
    }
}
