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
        return FestivalExamples.all
    }
    
}

