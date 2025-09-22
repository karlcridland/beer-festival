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
        let festival: Festival = Festival.example
        return [festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival, festival]
    }
    
}

