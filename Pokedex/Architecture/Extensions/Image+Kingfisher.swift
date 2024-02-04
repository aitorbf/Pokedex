//
//  Image+Kingfisher.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import SwiftUI
import Kingfisher

extension Image {
    
    static func cachedURL(_ url: URL?) -> KFImage {
        KFImage.url(url, cacheKey: url?.cacheKey)
    }
}
