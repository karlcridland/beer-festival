//
//  FestivalDrinksViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import Combine

class FestivalDrinksViewModel: ObservableObject {
    
    let festival: Festival
    var sortBy: FestivalDrinkSort
    
    init(festival: Festival, sortBy: FestivalDrinkSort) {
        self.festival = festival
        self.sortBy = sortBy
    }
    
    var drinks: [Drink] {
        [DrinkExamples.dryHopped, DrinkExamples.easeUpIPA, DrinkExamples.ghostShip]
    }
}
