//
//  Festival.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import Foundation
import CoreLocation

class Festival: FestivalProtocol, Hashable {
    
    let id: String
    let name: String
    let venue: Venue
    let coordinate: CLLocationCoordinate2D
    let tokens: Tokens
    let pricing: FestivalPricing
    var attendance: FestivalAttendance
    let inventory: Inventory
    
    let dates: [FestivalDate]
    
    init(id: String, name: String, venue: Venue, coordinate: CLLocationCoordinate2D, dates: [FestivalDate], tokens: Tokens? = nil, pricing: FestivalPricing, attendance: FestivalAttendance = .notAttending, inventory: Inventory? = nil) {
        self.id = id
        self.name = name
        self.venue = venue
        self.coordinate = coordinate
        self.dates = dates
        self.tokens = tokens ?? Tokens(id: id)
        self.pricing = pricing
        self.attendance = attendance
        self.inventory = inventory ?? Inventory(id: id)
    }
    
    internal func updateAttendance(to attendance: FestivalAttendance) {
        self.attendance = attendance
    }
    
    func redeemToken(for drink: Drink) throws {
        try tokens.redeemToken(drink)
    }
    
    func getDistance() -> CGFloat {
        return 0
    }
    
    func getDistance(_ longitude: CGFloat, _ latitude: CGFloat) -> CGFloat {
        return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude).distance(from: CLLocation(latitude: latitude, longitude: longitude))
    }
    
    var isInDateRange: Bool {
        let today = FestivalDate(from: Date())
        return dates.contains(where: { $0 == today })
    }
    
    static func == (lhs: Festival, rhs: Festival) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static var example: Festival {
        var dates: [FestivalDate] = []
        for i in 9 ..< 12 {
            let date = FestivalDate(day: i, month: 3, year: 2025)
            dates.append(date)
        }
        let colorScheme = VenueColorScheme(primary: "#00AFF2", accent: "#042B60")
        let venue: Venue = Venue(id: UUID().uuidString, name: "Cherry Tree Inn", address: "73 Cumberland Street", city: "Woodbridge", postcode: "IP12 4AG", colorScheme: colorScheme)
        let festival: Festival = Festival(id: UUID().uuidString, name: "Cherry Fest", venue: venue, coordinate: .init(latitude: 0, longitude: 0), dates: dates, pricing: FestivalPricing(entry: 0, token: 1))
        return festival
    }
    
}

enum FestivalAttendance: String {
    case attending
    case notAttending
    case mightAttend
}
