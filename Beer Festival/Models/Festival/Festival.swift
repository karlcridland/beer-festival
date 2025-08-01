//
//  Festival.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import Foundation
import CoreLocation

class Festival: FestivalProtocol {
    
    let id: String
    let name: String
    let location: String
    let coordinate: CLLocationCoordinate2D
    let stamps: Stamps
    let stampValue: Int
    var attendance: FestivalAttendance
    
    let dates: [FestivalDate]
    
    init(id: String, name: String, location: String, coordinate: CLLocationCoordinate2D, dates: [FestivalDate], stamps: Stamps? = nil, stampValue: Int, attendance: FestivalAttendance = .notAttending) {
        self.id = id
        self.name = name
        self.location = location
        self.coordinate = coordinate
        self.dates = dates
        self.stamps = stamps ?? Stamps(id: id)
        self.stampValue = stampValue
        self.attendance = attendance
    }
    
    func updateAttendance(to attendance: FestivalAttendance) {
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
    
}

enum FestivalAttendance: String {
    case attending
    case notAttending
    case mightAttend
}
