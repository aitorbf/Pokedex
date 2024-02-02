//
//  EntityWithHEaders.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 28/1/24.
//

import Foundation

struct EntityWithHeaders<D: Codable, H: Codable>: Entity {
    var data: D?
    var headers: H?
}
