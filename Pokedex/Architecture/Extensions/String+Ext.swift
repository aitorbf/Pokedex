//
//  String+Ext.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 4/2/24.
//

import Foundation

extension String {
    
    var firstUppercased: String {
        prefix(1).uppercased() + dropFirst()
    }
}
