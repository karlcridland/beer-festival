//
//  Brewery.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import Foundation

struct Brewery {
    
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
    
}
