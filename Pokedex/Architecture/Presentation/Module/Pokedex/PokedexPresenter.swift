//
//  PokedexPresenter.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation
import Combine

protocol PokedexPresenter: ObservableObject {
    var screenState: PokedexScreenState { get set }
    var pokemonList: PokedexViewModel { get set }
    var selectedRegionIndex: Int { get set }
    var isLoading: Bool { get set }
    var searchValue: String { get set }
    
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
    @Published var searchValue: String = ""
    
    private let searchDelay: CGFloat = 0.5
    private let getPokedexInteractor: GetPokedexInteractor
    private let setPokemonCatchedInteractor: SetPokemonCatchedInteractor
    private let router: PokedexRouter
    
    private var allPokemon: PokedexViewModel = .empty()
    private var debouncedSearchValue: String = "" {
        didSet {
            updatePokemonList()
        }
    }
    private var clearedSearchValue: String {
        debouncedSearchValue
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
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
        $searchValue
            .removeDuplicates()
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.isLoading = true
            })
            .debounce(for: .seconds(searchDelay), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
                self?.debouncedSearchValue = value
            })
            .store(in: &cancellables)
    }
}

extension PokedexPresenterDefault: PokedexPresenter, PokemonDetailDelegate {
    
    func loadPokedex(_ completion: (() -> Void)? = nil) {
        if [.empty, .content].contains(screenState) {
            isLoading = true
        }
        getPokedexInteractor.execute(region: PokemonRegion.allCases[selectedRegionIndex])
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.isLoading = false
                        self.screenState = .error
                    default:
                        break
                    }
                },
                receiveValue: { pokemonList in
                    self.allPokemon = PokedexViewModelMapper.map(pokemonList)
                    self.updatePokemonList()
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

private extension PokedexPresenterDefault {
    
    func updatePokemonList() {
        if clearedSearchValue.isEmpty {
            pokemonList = allPokemon
        } else {
            pokemonList.pokemonRows = allPokemon.pokemonRows.filter {
                $0.name.lowercased().contains(clearedSearchValue.lowercased())
            }
        }
        screenState = pokemonList.pokemonRows.count > 0 ? .content : .empty
        isLoading = false
    }
}
