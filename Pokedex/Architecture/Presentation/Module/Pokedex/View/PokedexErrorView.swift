//
//  PokedexErrorView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokedexErrorView<Presenter: PokedexPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    var retry: () -> Void
    
    private let iconSize: CGFloat = 32
    private let iconCircleSize: CGFloat = 128
    private let buttonWidth: CGFloat = 212
    
    var body: some View {
        VStack(spacing: Theme.Spacing.space_2) {
            Spacer()
            icon
            explanation
            button
            Spacer()
        }
        .onChange(of: presenter.selectedRegionIndex) { _ in
            presenter.loadPokedex {
                // Intentionally empty
            }
        }
    }
    
    var icon: some View {
        ZStack {
            Image(Assets.images.emptyPokeball)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Theme.Color.onPrimary)
                .frame(width: iconCircleSize, height: iconCircleSize)
            Image(Assets.icon.exclamationIcon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Theme.Color.error)
                .frame(width: iconSize, height: iconSize)
        }
        .padding(.bottom, Theme.Spacing.space_2)
    }
    
    var explanation: some View {
        Text(Strings.pokedexError)
            .font(Theme.Font.body1)
            .foregroundColor(Theme.Color.onBackground)
            .multilineTextAlignment(.center)
            .padding(.horizontal, Theme.Spacing.space_10)
            .padding(.bottom, Theme.Spacing.space_1)
    }
    
    var button: some View {
        Button(Strings.pokedexRetry) {
            retry()
        }
        .buttonStyle(.filled)
        .frame(width: buttonWidth)
    }
}

struct PokedexErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = [Pokemon.mock()]
        let presenter: MockPokedexPresenter = MockPokedexPresenter(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexErrorView<MockPokedexPresenter>() { }
                    .environmentObject(presenter)
            }
        }
    }
}
