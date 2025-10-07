//
//  DrinkExamples.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

class DrinkExamples {
    
    static let adnams: Brewery = Brewery(name: "Adnams")
    
    static let easeUpIPA = Drink(name: "Ease Up", brewery: adnams, type: .indianPaleAle, percentage: 4.6)
    static let dryHopped = Drink(name: "Dry Hopped", brewery: adnams, type: .lager, percentage: 4.2)
    static let ghostShip = Drink(name: "Ghost Ship", brewery: adnams, type: .paleAle, percentage: 4.5)
    
}
