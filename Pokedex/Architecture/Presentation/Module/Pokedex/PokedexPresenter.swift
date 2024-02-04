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
    
    func loadPokemon()
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
    
    private let getPokedexInteractor: GetPokedexInteractor
    private let router: PokedexRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        getPokedexInteractor: GetPokedexInteractor,
        router: PokedexRouter
    ) {
        self.getPokedexInteractor = getPokedexInteractor
        self.router = router
        
        loadPokemon()
    }
}

extension PokedexPresenterDefault: PokedexPresenter {
    
    func loadPokemon() {
        screenState = .loading
        getPokedexInteractor.execute(region: .kanto)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.screenState = .error
                    case .finished:
                        break
                    }
                },
                receiveValue: { pokemonList in
                    self.pokemonList = PokemonViewModelMapper.map(pokemonList)
                    self.screenState = self.pokemonList.pokemon.isEmpty ? .empty : .content
                }
            )
            .store(in: &cancellables)
    }
    
    func loadPokemonDetail(id: String) {
//        router.navigateToPokemonDetail(id: id)
    }
}
