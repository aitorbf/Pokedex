//
//  DataError.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 28/1/24.
//

import Foundation

enum DataError: Error, Equatable {
    
    case invalidUrl
    case encoding
    case decoding
    case badRequest
    case unauthorized
    case forbidden
    case server
    case maintenanceMode
    case network
    case notFound
    case conflict
    case tooManyRequests(retryAfterMiliseconds: Int?)
    case unknown
}
