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
    let stamps: Stamps
    let pricing: FestivalPricing
    var attendance: FestivalAttendance
    let inventory: Inventory
    
    let dates: [FestivalDate]
    
    init(id: String, name: String, venue: Venue, coordinate: CLLocationCoordinate2D, dates: [FestivalDate], stamps: Stamps? = nil, pricing: FestivalPricing, attendance: FestivalAttendance = .notAttending, inventory: Inventory? = nil) {
        self.id = id
        self.name = name
        self.venue = venue
        self.coordinate = coordinate
        self.dates = dates
        self.stamps = stamps ?? Stamps(id: id)
        self.pricing = pricing
        self.attendance = attendance
        self.inventory = inventory ?? Inventory(id: id)
    }
    
    internal func updateAttendance(to attendance: FestivalAttendance) {
        self.attendance = attendance
    }
    
    func redeemToken(for drink: Drink) throws {
        try stamps.redeemStamp(drink)
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
        let venue: Venue = Venue(id: UUID().uuidString, name: "The King's Head", address: "17 Pemberton Way", city: "Hadleigh", postcode: "PB17 1WY")
        let festival: Festival = Festival(id: UUID().uuidString, name: "Test Festival", venue: venue, coordinate: .init(latitude: 0, longitude: 0), dates: dates, pricing: FestivalPricing(entry: 0, stamp: 1))
        return festival
    }
    
}

enum FestivalAttendance: String {
    case attending
    case notAttending
    case mightAttend
}
