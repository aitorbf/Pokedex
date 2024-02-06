// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI
import UIKit

// MARK: - Asset Catalogs

internal enum Assets {
  internal static var accentColor = Color("AccentColor")
  internal enum icon {
    internal static let exclamation: String = "exclamation"
    internal static let warningIcon: String = "warningIcon"
  }
  internal enum images {
    internal static let pokeball: String = "pokeball"
    internal static let pokedex: String = "pokedex"
    internal static let pokemonShadow: String = "pokemonShadow"
  }
  internal enum pokemonTypes {
    internal static let bug: String = "bug"
    internal static let dragon: String = "dragon"
    internal static let electric: String = "electric"
    internal static let fairy: String = "fairy"
    internal static let fighting: String = "fighting"
    internal static let fire: String = "fire"
    internal static let flying: String = "flying"
    internal static let ghost: String = "ghost"
    internal static let grass: String = "grass"
    internal static let ground: String = "ground"
    internal static let ice: String = "ice"
    internal static let normal: String = "normal"
    internal static let poison: String = "poison"
    internal static let psychic: String = "psychic"
    internal static let rock: String = "rock"
    internal static let steel: String = "steel"
    internal static let water: String = "water"
  }
}

// MARK: - Implementation Details
internal extension SwiftUI.Color {
    var uikitColor: UIColor {
        UIColor(self)
    }
}
