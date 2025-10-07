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
    let city: String
    let postcode: String
    var colorScheme: VenueColorScheme
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var toString: String {
        [name, address, city, postcode].joined(separator: ", ")
    }
    
}
