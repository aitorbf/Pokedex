//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import Combine

protocol PokemonDetailPresenter: ObservableObject {
    var screenState: PokemonDetailScreenState { get set }
    var pokemonDetail: PokemonDetailViewModel { get set }
    
    func loadPokemonDetail()
    func reload()
    func goBack()
}

enum PokemonDetailScreenState {
    case loading
    case error
    case empty
    case content
}

final class PokemonDetailPresenterDefault {
    
    @Published var screenState: PokemonDetailScreenState = .loading
    @Published var pokemonDetail: PokemonDetailViewModel = .empty()
    
    private let pokemonNumber: String
    private let getPokemonDetailInteractor: GetPokemonDetailInteractor
    private let router: PokemonDetailRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        pokemonNumber: String,
        getPokemonDetailInteractor: GetPokemonDetailInteractor,
        router: PokemonDetailRouter
    ) {
        self.pokemonNumber = pokemonNumber
        self.getPokemonDetailInteractor = getPokemonDetailInteractor
        self.router = router
    }
}

extension PokemonDetailPresenterDefault: PokemonDetailPresenter {
    
    func loadPokemonDetail() {
        getPokemonDetailInteractor.execute(id: pokemonNumber)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.screenState = .error
                    case .finished:
                        break
                    }
                },
                receiveValue: { pokemonDetail in
                    self.pokemonDetail = PokemonDetailViewModelMapper.map(pokemonDetail)
                    self.screenState = .content
                }
            )
            .store(in: &cancellables)
    }
    
    func reload() {
        screenState = .loading
        loadPokemonDetail()
    }
    
    func goBack() {
        router.navigateBack()
    }
}
