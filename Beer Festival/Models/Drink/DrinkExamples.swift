//
//  DrinkExamples.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

class DrinkExamples {
    
    static let adnams: Brewery = Brewery(name: "Adnams")
    
    static let easeUpIPA = Drink(name: "Ease Up", brewery: adnams, type: .indianPaleAle, percentage: 4.6, description: "Ease Up is a golden session IPA with wonderful citrus flavours thanks to a stellar cast of bright, aromatic hops. Following calls to add a gluten free beer to the Adnams range, we’ve tweaked the process when brewing it, making its big-hitting more accessible. It still has that same great grapefruit flavour, but it’s now also gluten free.")
    static let dryHopped = Drink(name: "Dry Hopped", brewery: adnams, type: .lager, percentage: 4.2, description: "Dry Hopped Lager is brewed with pale malts and Australian Galaxy hops for their bright, tropical fruit flavours, especially when used as a late addition. Bold, bright and crisp, it’s shore thing refreshment.")
    static let ghostShip = Drink(name: "Ghost Ship", brewery: adnams, type: .paleAle, percentage: 4.5, description: "Our best-selling beer is inspired by tall tales of the ghostly ships that haunted the shores of Walberswick. Enjoy whispers of aromatic elderflower, bold citrus and gooseberry flavours, with hints of warming rye spice.")
    
}
