//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 6/2/24.
//

import Combine

protocol PokemonDetailDelegate: AnyObject {
    func didCatchPokemon(number: Int)
}

protocol PokemonDetailPresenter: ObservableObject {
    var screenState: PokemonDetailScreenState { get set }
    var pokemonDetail: PokemonDetailViewModel { get set }
    
    func loadPokemonDetail()
    func reload()
    func didCatchPokemon()
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
    
    weak var delegate: PokemonDetailDelegate?
    
    private let pokemonNumber: Int
    private let getPokemonDetailInteractor: GetPokemonDetailInteractor
    private let router: PokemonDetailRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        pokemonNumber: Int,
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
        getPokemonDetailInteractor.execute(number: pokemonNumber)
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
                    self.screenState = self.pokemonDetail == .empty() ? .empty : .content
                }
            )
            .store(in: &cancellables)
    }
    
    func reload() {
        screenState = .loading
        loadPokemonDetail()
    }
    
    func didCatchPokemon() {
        pokemonDetail.isCatched.toggle()
        delegate?.didCatchPokemon(number: pokemonNumber)
    }
    
    func goBack() {
        router.navigateBack()
    }
}
