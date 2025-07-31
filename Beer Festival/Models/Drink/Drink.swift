//
//  Drink.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

struct Drink {
    
    let name: String
    let type: DrinkType
    let percentage: Double?
    
    var isAlcoholic: Bool {
        percentage != nil || percentage ?? 0 <= 0.5
    }
    
}
