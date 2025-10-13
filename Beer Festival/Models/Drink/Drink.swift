//
//  Drink.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import Foundation

struct Drink: Identifiable {
    
    let id: String
    let name: String
    let brewery: Brewery
    let type: DrinkType
    let percentage: Double?
    let description: String?
    
    init(id: String = UUID().uuidString, name: String, brewery: Brewery, type: DrinkType, percentage: Double? = nil, description: String? = nil) {
        self.id = id
        self.name = name
        self.brewery = brewery
        self.type = type
        self.percentage = percentage
        self.description = description
    }
    
    var isAlcoholic: Bool {
        percentage != nil || percentage ?? 0 <= 0.5
    }
    
}
