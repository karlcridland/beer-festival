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
        let festival: Festival = Festival(id: UUID().uuidString, name: "Test Festival", location: "Zimbabwe", coordinate: .init(latitude: 0, longitude: 0), dates: [], pricing: FestivalPricing(entry: 0, stamp: 1))
        return [festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival]
    }
    
}
