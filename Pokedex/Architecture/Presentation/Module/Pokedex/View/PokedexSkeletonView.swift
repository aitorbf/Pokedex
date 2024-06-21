//
//  PokedexSkeletonView.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import SwiftUI

struct PokedexSkeletonView: View {
    
    private let numberOfItems: Int = 10
    private let rowSizeHeight: CGFloat = 64
    private let avatarSize: CGFloat = 90
    private let backgroundImageSize: CGFloat = 150
    private let leadingBackgroundImageXOffset: CGFloat = 35
    private let trailingBackgroundImageXOffset: CGFloat = -35
    private let backgroundImageYOffset: CGFloat = 15
    private let backgroundImageOpacity: CGFloat = 0.03
    private let nameRectangleWidth: CGFloat = 64
    private let nameRectangleHeight: CGFloat = 24
    
    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.space_3) {
                ForEach(1...numberOfItems, id: \.self) { index in
                    item(contentPosition: index % 2 == 0 ? .trailing : .leading)
                }
            }
            .padding(Theme.Spacing.space_2)
        }
    }
    
    func item(contentPosition: RowContentPosition) -> some View {
        ZStack {
            background(contentPosition: contentPosition)
            content(contentPosition: contentPosition)
        }
    }
    
    func background(contentPosition: RowContentPosition) -> some View {
        Rectangle()
            .foregroundColor(Theme.Color.onPrimary)
            .overlay {
                backgroundImage(contentPosition: contentPosition)
            }
            .frame(height: rowSizeHeight)
            .cornerRadius(Theme.Spacing.space_1)
    }
    
    func backgroundImage(contentPosition: RowContentPosition) -> some View {
        HStack {
            if contentPosition == .leading {
                Spacer()
            }
            Image(Assets.images.emptyPokeball)
                .resizable()
                .frame(width: backgroundImageSize, height: backgroundImageSize)
                .offset(
                    x: contentPosition == .leading ? leadingBackgroundImageXOffset : trailingBackgroundImageXOffset,
                    y: backgroundImageYOffset
                )
                .opacity(backgroundImageOpacity)
            if contentPosition == .trailing {
                Spacer()
            }
        }
    }
    
    func content(contentPosition: RowContentPosition) -> some View {
        HStack(spacing: Theme.Spacing.space_2) {
            switch contentPosition {
            case .leading:
                number
                picture
                name
                Spacer()
            case .trailing:
                Spacer()
                name
                picture
                number
            }
        }
        .frame(height: rowSizeHeight)
        .padding(.horizontal, Theme.Spacing.space_2)
    }
    
    var number: some View {
        Circle()
            .fill(Theme.Color.transparentPrimary5)
            .padding(.vertical, Theme.Spacing.space_1_5)
    }
    
    var picture: some View {
        Image(Assets.images.pokemonShadow)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Theme.Color.transparentPrimary12)
            .aspectRatio(contentMode: .fill)
            .frame(width: avatarSize, height: avatarSize)
    }
    
    var name: some View {
        Rectangle()
            .foregroundColor(Theme.Color.transparentPrimary5)
            .frame(width: nameRectangleWidth, height: nameRectangleHeight)
            .cornerRadius(Theme.Spacing.space_1)
    }
}

struct PokedexSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexSkeletonView()
            }
        }
    }
}
