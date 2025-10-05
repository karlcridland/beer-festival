//
//  MockFestival.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import CoreLocation

class MockFestival: Festival {
    
    init(tokens: Int = 10, dates: [FestivalDate] = [], maxQuantity: Int = 10, initialStock: Int = 5) {
        let id: String = UUID().uuidString
        super.init(
            id: id,
            name: "Test Festival",
            location: "123 Fake Street",
            coordinate: CLLocationCoordinate2D(latitude: 52.04570477764604, longitude: 0.9582248594437506),
            dates: dates,
            tokens: MockTokens(id: id, tokens: tokens),
            pricing: FestivalPricing(entry: 1000, token: 500),
            inventory: MockInventory(id: id, maxQuantity: maxQuantity, initialStock: initialStock)
        )
    }
    
}
