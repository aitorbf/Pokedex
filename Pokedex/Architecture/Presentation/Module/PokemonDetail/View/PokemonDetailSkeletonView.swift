//
//  PokemonDetailSkeletonView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokemonDetailSkeletonView: View {
    
    private let nameHeight: CGFloat = 30
    private let nameWidth: CGFloat = 180
    private let numberHeight: CGFloat = 90
    private let numberWidth: CGFloat = 220
    private let backgroundImageSize: CGFloat = 300
    private let backgroundImageOpacity: CGFloat = 0.6
    private let pokemonImageSize: CGFloat = 220
    private let typeHeight: CGFloat = 24
    private let typeWidth: CGFloat = 60
    private let statNameHeight: CGFloat = 12
    private let statNameWidth: CGFloat = 80
    private let statValueHeight: CGFloat = 12
    private let statValueWidth: CGFloat = 50
    private let dataContainerHeight: CGFloat = 0.4
    
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .center) {
                VStack(alignment: .center, spacing: .zero) {
                    name
                    number
                    Spacer()
                }
                backgroundImage
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Theme.Color.transparentPrimary5)
                            .cornerRadius(Theme.Radius.large, corners: [.topLeft, .topRight])
                            .ignoresSafeArea()
                        VStack {
                            types
                            Spacer()
                        }
                        .padding(.top, Theme.Spacing.space_8)
                        stats
                    }
                    .frame(height: metrics.size.height * dataContainerHeight)
                }
                pokemonImage
            }
        }
    }
    
    var name: some View {
        Rectangle()
            .frame(width: nameWidth, height: nameHeight)
            .foregroundColor(Theme.Color.transparentPrimary12)
            .cornerRadius(Theme.Radius.small)
            .padding(.top, Theme.Spacing.space_2)
            .padding(.bottom, Theme.Spacing.space_8)
    }
    
    var number: some View {
        Rectangle()
            .frame(width: numberWidth, height: numberHeight)
            .foregroundColor(Theme.Color.transparentPrimary12)
            .cornerRadius(Theme.Radius.small)
    }
    
    var backgroundImage: some View {
        Image(Assets.images.pokeball)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Theme.Color.onPrimary)
            .frame(width: backgroundImageSize, height: backgroundImageSize)
            .opacity(backgroundImageOpacity)
    }
    var types: some View {
        Capsule()
            .frame(width: typeWidth, height: typeHeight)
            .foregroundColor(Theme.Color.transparentPrimary12)
    }
    
    var stats: some View {
        HStack(alignment: .center) {
            Spacer()
            VStack {
                Rectangle()
                    .frame(width: statNameWidth, height: statNameHeight)
                    .foregroundColor(Theme.Color.transparentPrimary12)
                    .cornerRadius(Theme.Radius.small)
                Rectangle()
                    .frame(width: statValueWidth, height: statValueHeight)
                    .foregroundColor(Theme.Color.transparentPrimary12)
                    .cornerRadius(Theme.Radius.small)
            }
            Spacer()
            VStack {
                Rectangle()
                    .frame(width: statNameWidth, height: statNameHeight)
                    .foregroundColor(Theme.Color.transparentPrimary12)
                    .cornerRadius(Theme.Radius.small)
                Rectangle()
                    .frame(width: statValueWidth, height: statValueHeight)
                    .foregroundColor(Theme.Color.transparentPrimary12)
                    .cornerRadius(Theme.Radius.small)
            }
            Spacer()
        }
    }
    
    var pokemonImage: some View {
        Image(Assets.images.pokemonShadow)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Theme.Color.transparentPrimary12)
            .aspectRatio(contentMode: .fill)
            .frame(width: pokemonImageSize, height: pokemonImageSize)
    }
}

struct PokemonDetailSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokemonDetailSkeletonView()
            }
        }
    }
}
