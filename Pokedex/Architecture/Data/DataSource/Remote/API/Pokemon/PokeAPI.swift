//
//  PokeAPI.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 28/1/24.
//

import Foundation

extension API.Pokemon {
    
    enum PokeAPI: URLRequestConvertible {
        
        case list(request: GetPokemonListRequest)
        case detail(id: String)
        
        var method: HttpConstants.Method {
            switch self {
            case .list, .detail:
                return .get
            }
        }
        
        var endpoint: URL? {
            switch self {
            case .list(let request):
                return URL(string: HttpConstants.apiBaseURL + "v2/pokedex/\(request.pokedexNumber)")
            case .detail(let id):
                return URL(string: HttpConstants.apiBaseURL + "v2/pokemon/\(id)/")
            }
        }
        
        func addHeaders(toRequest request: inout URLRequest) {
            // Intentionally empty
        }
        
        func addBody(toRequest request: inout URLRequest) {
            // Intentionally empty
        }
    }
}
