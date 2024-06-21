//
//  PokeAPI.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 28/1/24.
//

import Foundation

extension API.Pokemon {
    
    enum PokeAPI: URLRequestConvertible {
        
        case list(request: GetPokedexRequest)
        case detail(number: Int)
        
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
            case .detail(let number):
                return URL(string: HttpConstants.apiBaseURL + "v2/pokemon/\(number)")
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
