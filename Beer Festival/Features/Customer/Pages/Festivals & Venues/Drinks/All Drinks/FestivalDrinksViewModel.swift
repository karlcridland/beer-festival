//
//  FestivalDrinksViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import Combine
import Foundation

class FestivalDrinksViewModel: ObservableObject {
    
    let festival: Festival
    var sortBy: FestivalDrinkSort
    
    @Published var refreshID: String
    
    var searchQuery: String?
    
    init(festival: Festival, sortBy: FestivalDrinkSort) {
        self.festival = festival
        self.sortBy = sortBy
        self.refreshID = UUID().uuidString
    }
    
    func refresh() {
        self.refreshID = UUID().uuidString
    }
    
    var drinks: [Drink] {
        if let searchQuery = searchQuery?.lowercased(), !searchQuery.isEmpty {
            return allDrinks.filter({$0.name.lowercased().contains(searchQuery)})
        }
        return allDrinks
    }
    
    var allDrinks: [Drink] {
        [DrinkExamples.dryHopped, DrinkExamples.easeUpIPA, DrinkExamples.ghostShip]
    }
    
}
