//
//  PokedexPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Combine

protocol PokedexPresenter: ObservableObject {
    var screenState: PokedexScreenState { get set }
    var pokemonList: PokemonViewModel { get set }
    var selectedRegionIndex: Int { get set }
    var isLoading: Bool { get set }
    
    func loadPokedex()
    func reload()
    func loadPokemonDetail(id: String)
}

enum PokedexScreenState {
    case loading
    case error
    case empty
    case content
}

final class PokedexPresenterDefault {
    
    @Published var screenState: PokedexScreenState = .loading
    @Published var pokemonList: PokemonViewModel = .empty()
    @Published var selectedRegionIndex: Int = 0 {
        didSet {
            loadPokedex()
        }
    }
    @Published var isLoading: Bool = false
    
    private let getPokedexInteractor: GetPokedexInteractor
    private let router: PokedexRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        getPokedexInteractor: GetPokedexInteractor,
        router: PokedexRouter
    ) {
        self.getPokedexInteractor = getPokedexInteractor
        self.router = router
    }
}

extension PokedexPresenterDefault: PokedexPresenter {
    
    func loadPokedex() {
        if screenState == .content {
            isLoading = true
        }
        getPokedexInteractor.execute(region: PokemonRegion.allCases[selectedRegionIndex])
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.screenState = .error
                    case .finished:
                        self.isLoading = false
                    }
                },
                receiveValue: { pokemonList in
                    self.pokemonList = PokemonViewModelMapper.map(pokemonList)
                    self.screenState = self.pokemonList.pokemon.isEmpty ? .empty : .content
                }
            )
            .store(in: &cancellables)
    }
    
    func reload() {
        screenState = .loading
        loadPokedex()
    }
    
    func loadPokemonDetail(id: String) {
        router.navigateToPokemonDetail(id: id)
    }
}
