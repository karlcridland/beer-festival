//
//  FestivalProtocol.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

protocol FestivalProtocol {
    
    var name: String { get }
    var location: String { get }
    var dates: [FestivalDate] { get }
    var pricing: FestivalPricing { get }
    var isInDateRange: Bool { get }
    var attendance: FestivalAttendance { get set }
    
    func redeemToken(for drink: Drink) throws
    func updateAttendance(to attendance: FestivalAttendance)
    
}
