//
//  MockFestival.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import CoreLocation

class MockFestival: Festival {
    
    init() {
        super.init(
            id: UUID().uuidString,
            name: "Test Festival",
            location: "123 Fake Street",
            coordinate: CLLocationCoordinate2D(latitude: 52.04570477764604, longitude: 0.9582248594437506),
            dates: []
        )
    }
    
}
