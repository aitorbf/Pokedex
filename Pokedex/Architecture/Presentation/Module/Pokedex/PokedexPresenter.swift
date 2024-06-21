//
//  PokedexPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Combine

protocol PokedexPresenter: ObservableObject {
    var screenState: PokedexScreenState { get set }
    var pokemonList: PokedexViewModel { get set }
    var selectedRegionIndex: Int { get set }
    var isLoading: Bool { get set }
    
    func loadPokedex(_ completion: (() -> Void)?)
    func reload()
    func didCatchPokemon(number: Int)
    func showPokemonDetail(number: Int)
}

enum PokedexScreenState {
    case loading
    case error
    case empty
    case content
}

final class PokedexPresenterDefault {
    
    @Published var screenState: PokedexScreenState = .loading
    @Published var pokemonList: PokedexViewModel = .empty()
    @Published var selectedRegionIndex: Int = 0
    @Published var isLoading: Bool = false
    
    private let getPokedexInteractor: GetPokedexInteractor
    private let setPokemonCatchedInteractor: SetPokemonCatchedInteractor
    private let router: PokedexRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        getPokedexInteractor: GetPokedexInteractor,
        setPokemonCatchedInteractor: SetPokemonCatchedInteractor,
        router: PokedexRouter
    ) {
        self.getPokedexInteractor = getPokedexInteractor
        self.setPokemonCatchedInteractor = setPokemonCatchedInteractor
        self.router = router
        
        loadPokedex()
    }
}

extension PokedexPresenterDefault: PokedexPresenter, PokemonDetailDelegate {
    
    func loadPokedex(_ completion: (() -> Void)? = nil) {
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
                    self.pokemonList = PokedexViewModelMapper.map(pokemonList)
                    self.screenState = self.pokemonList.pokemonRows.isEmpty ? .empty : .content
                    completion?()
                }
            )
            .store(in: &cancellables)
    }
    
    func reload() {
        screenState = .loading
        loadPokedex()
    }
    
    func didCatchPokemon(number: Int) {
        if let index = pokemonList.pokemonRows.firstIndex(where: { $0.number == number }) {
            pokemonList.pokemonRows[index].isCatched.toggle()
            setPokemonCatchedInteractor.execute(
                pokemonList.pokemonRows[index].isCatched,
                number: pokemonList.pokemonRows[index].number
            )
        }
    }
    
    func showPokemonDetail(number: Int) {
        router.navigateToPokemonDetail(number: number, delegate: self)
    }
}
