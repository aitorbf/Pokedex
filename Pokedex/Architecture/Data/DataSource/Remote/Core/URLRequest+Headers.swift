//
//  URLRequest+Headers.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 28/1/24.
//

import Foundation

extension URLRequest {
    
    mutating func addContentHeaders() {
        setValue(HttpConstants.HeaderValue.applicationJson, forHTTPHeaderField: HttpConstants.Header.contentType)
    }
}

extension URLRequest {
    
    mutating func addEncodedBody(withParams params: Encodable) {
        httpBody = try? JSONEncoder().encode(params)
    }
}
