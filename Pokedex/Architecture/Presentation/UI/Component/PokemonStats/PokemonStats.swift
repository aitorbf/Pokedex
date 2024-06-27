//
//  PokemonStats.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 24/6/24.
//

import SwiftUI
import DDSpiderChart

struct PokemonStats: View {
    
    let stats: [PokemonStatViewModel]
    let color: Color
    
    private let maxStatValue: Int = 255
    private let pokemonStatsChartWidth: CGFloat = 350
    private let pokemonStatsChartHeight: CGFloat = 300
    
    var body: some View {
        DDSpiderChart(
            axes: stats.map({ $0.abbreviatedName }),
            values: [
                DDSpiderChartEntries(
                    values: stats.map({ Float($0.value) / Float(maxStatValue) }),
                    color: color
                )
            ],
            color: Theme.Color.neutral70,
            fontTitle: .systemFont(ofSize: 16),
            textColor: Theme.Color.primary
        )
        .frame(width: pokemonStatsChartWidth, height: pokemonStatsChartHeight)
    }
}
