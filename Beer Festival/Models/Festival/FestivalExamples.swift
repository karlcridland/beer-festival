//
//  FestivalExamples.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/10/2025.
//

import Foundation

class FestivalExamples {
    
    static var primary: Festival = {
        return greeneKing
    }()
    
    static var all: [Festival] {
        [adnams, greeneKing, test]
    }
    
    static var adnams: Festival = {
        var dates: [FestivalDate] = []
        for i in 9 ..< 12 {
            let date = FestivalDate(day: i, month: 3, year: 2025)
            dates.append(date)
        }
        let colorScheme = VenueColorScheme(primary: "#00AFF2", accent: "#042B60")
        let venue: Venue = Venue(id: UUID().uuidString, name: "Cherry Tree Inn", address: "73 Cumberland Street", city: "Woodbridge", postcode: "IP12 4AG", colorScheme: colorScheme)
        let festival: Festival = Festival(id: UUID().uuidString, name: "Cherry Tree Fest", venue: venue, coordinate: .init(latitude: 52.08993097257285, longitude: 1.3101622863092206), dates: dates, pricing: FestivalPricing(entry: 0, token: 1))
        return festival
    }()
    
    static var greeneKing: Festival = {
        var dates: [FestivalDate] = []
        for i in 9 ..< 12 {
            let date = FestivalDate(day: i, month: 3, year: 2025)
            dates.append(date)
        }
        let colorScheme = VenueColorScheme(primary: "#154734", accent: "#fff", accentText: .black)
        let venue: Venue = Venue(id: UUID().uuidString, name: "Fox Inn", address: "1 Eastgate Street", city: "Bury St. Edmunds", postcode: "IP33 1XX", colorScheme: colorScheme)
        let festival: Festival = Festival(id: UUID().uuidString, name: "Greene King Beer Festival", venue: venue, coordinate: .init(latitude: 52.246615357779, longitude: 0.7200961377029919), dates: dates, pricing: FestivalPricing(entry: 0, token: 1))
        return festival
    }()
    
    static var test: Festival = {
        var dates: [FestivalDate] = []
        for i in 9 ..< 12 {
            let date = FestivalDate(day: i, month: 3, year: 2025)
            dates.append(date)
        }
        let colorScheme = VenueColorScheme(primary: "#fff", accent: "#000", primaryText: .black)
        let venue: Venue = Venue(id: UUID().uuidString, name: "Cock Inn", address: "1 Threadneedle Street", city: "Hadleigh", postcode: "IP7 5DF", colorScheme: colorScheme)
        let festival: Festival = Festival(id: UUID().uuidString, name: "Testival", venue: venue, coordinate: .init(latitude: 52.045506400978574, longitude: 0.9585712144744596), dates: dates, pricing: FestivalPricing(entry: 0, token: 1))
        return festival
    }()
    
}
