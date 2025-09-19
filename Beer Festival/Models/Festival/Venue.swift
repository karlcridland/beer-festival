//
//  Venue.swift
//  Beer Festival
//
//  Created by Karl Cridland on 19/09/2025.
//

struct Venue: Hashable {
    
    let id: String
    let name: String
    let address: String
    let postcode: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
