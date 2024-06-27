// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// MARK: - Strings

internal enum Strings {
  /// There are no Pokémon in the Pokédex
  internal static let pokedexEmpty = Strings.tr("Localizable", "pokedex_empty", fallback: "There are no Pokémon in the Pokédex")
  /// Unable to load the Pokédex, please try again
  internal static let pokedexError = Strings.tr("Localizable", "pokedex_error", fallback: "Unable to load the Pokédex, please try again")
  /// Retry
  internal static let pokedexRetry = Strings.tr("Localizable", "pokedex_retry", fallback: "Retry")
  /// Localizable.strings
  ///   Pokedex
  /// 
  ///   Created by Aitor Baragaño Fernández on 4/2/24.
  internal static let pokedexSearchPlaceholder = Strings.tr("Localizable", "pokedex_search_placeholder", fallback: "Search...")
  /// Pokémon not found
  internal static let pokemonDetailEmpty = Strings.tr("Localizable", "pokemon_detail_empty", fallback: "Pokémon not found")
  /// Unable to load the Pokémon, please try again
  internal static let pokemonDetailError = Strings.tr("Localizable", "pokemon_detail_error", fallback: "Unable to load the Pokémon, please try again")
  /// Height
  internal static let pokemonDetailHeight = Strings.tr("Localizable", "pokemon_detail_height", fallback: "Height")
  /// Retry
  internal static let pokemonDetailRetry = Strings.tr("Localizable", "pokemon_detail_retry", fallback: "Retry")
  /// Weight
  internal static let pokemonDetailWeight = Strings.tr("Localizable", "pokemon_detail_weight", fallback: "Weight")
  /// bug
  internal static let pokemonTypeBug = Strings.tr("Localizable", "pokemon_type_bug", fallback: "bug")
  /// dark
  internal static let pokemonTypeDark = Strings.tr("Localizable", "pokemon_type_dark", fallback: "dark")
  /// dragon
  internal static let pokemonTypeDragon = Strings.tr("Localizable", "pokemon_type_dragon", fallback: "dragon")
  /// electric
  internal static let pokemonTypeElectric = Strings.tr("Localizable", "pokemon_type_electric", fallback: "electric")
  /// fairy
  internal static let pokemonTypeFairy = Strings.tr("Localizable", "pokemon_type_fairy", fallback: "fairy")
  /// fighting
  internal static let pokemonTypeFighting = Strings.tr("Localizable", "pokemon_type_fighting", fallback: "fighting")
  /// fire
  internal static let pokemonTypeFire = Strings.tr("Localizable", "pokemon_type_fire", fallback: "fire")
  /// flying
  internal static let pokemonTypeFlying = Strings.tr("Localizable", "pokemon_type_flying", fallback: "flying")
  /// ghost
  internal static let pokemonTypeGhost = Strings.tr("Localizable", "pokemon_type_ghost", fallback: "ghost")
  /// grass
  internal static let pokemonTypeGrass = Strings.tr("Localizable", "pokemon_type_grass", fallback: "grass")
  /// ground
  internal static let pokemonTypeGround = Strings.tr("Localizable", "pokemon_type_ground", fallback: "ground")
  /// ice
  internal static let pokemonTypeIce = Strings.tr("Localizable", "pokemon_type_ice", fallback: "ice")
  /// normal
  internal static let pokemonTypeNormal = Strings.tr("Localizable", "pokemon_type_normal", fallback: "normal")
  /// poison
  internal static let pokemonTypePoison = Strings.tr("Localizable", "pokemon_type_poison", fallback: "poison")
  /// psychic
  internal static let pokemonTypePsychic = Strings.tr("Localizable", "pokemon_type_psychic", fallback: "psychic")
  /// rock
  internal static let pokemonTypeRock = Strings.tr("Localizable", "pokemon_type_rock", fallback: "rock")
  /// steel
  internal static let pokemonTypeSteel = Strings.tr("Localizable", "pokemon_type_steel", fallback: "steel")
  /// stellar
  internal static let pokemonTypeStellar = Strings.tr("Localizable", "pokemon_type_stellar", fallback: "stellar")
  /// ???
  internal static let pokemonTypeUnknown = Strings.tr("Localizable", "pokemon_type_unknown", fallback: "???")
  /// water
  internal static let pokemonTypeWater = Strings.tr("Localizable", "pokemon_type_water", fallback: "water")
}

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
