//
//  VenueViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 25/09/2025.
//

import Foundation

class VenueViewModel: ObservableObject {
    
    let venue: Venue
    
    init(venue: Venue) {
        self.venue = venue
    }
    
}
