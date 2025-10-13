//
//  FestivalDrinkViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/10/2025.
//

import Foundation

class FestivalDrinkViewModel: ObservableObject {
    
    let drink: Drink
    
    #warning ("TODO: Retrieve the user's score for a drink.")
    @Published var userScore: Double = 0
    
    init(drink: Drink) {
        self.drink = drink
    }
    
    var averageScore: Double {
        #warning ("TODO: Retrieve an average score for a drink.")
        return 0.82
    }
    
    func updateScore(to value: Int) {
        #warning ("TODO: Update a users score on the database, adding to the average.")
        userScore = Double(value) / 5
    }
    
    var headerTitle: String {
        if let percentage = drink.percentage {
            return "\(drink.name) \(percentage)%"
        }
        return drink.name
    }
    
    var headerSubtitle: String {
        [drink.type.rawValue, drink.brewery.name].joined(separator: " - ")
    }
    
}
