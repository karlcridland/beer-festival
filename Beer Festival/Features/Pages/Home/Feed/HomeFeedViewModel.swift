//
//  HomeFeedViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import Foundation
import CoreLocation

class HomeFeedViewModel: ObservableObject {
    
    var festivals: [Festival] {
        var dates: [FestivalDate] = []
        for i in 9 ..< 12 {
            let date = FestivalDate(day: i, month: 3, year: 2025)
            dates.append(date)
        }
        let venue: Venue = Venue(id: UUID().uuidString, name: "The King's Head", address: "17 Pemberton Way", city: "Hadleigh", postcode: "PB17 1WY")
        let festival: Festival = Festival(id: UUID().uuidString, name: "Test Festival", venue: venue, coordinate: .init(latitude: 0, longitude: 0), dates: dates, pricing: FestivalPricing(entry: 0, stamp: 1))
        return [festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival]
    }
    
}
