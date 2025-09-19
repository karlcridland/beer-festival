//
//  FestivalDate.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

import Foundation

struct FestivalDate: Codable {
    
    let day, month, year: Int
    
    init(from date: Date) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        self.day = components.day ?? 1
        self.month = components.month ?? 1
        self.year = components.year ?? 1970
    }
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    var toDate: String {
        return "\(day)/\(month)/\(year)"
    }
    
    static func < (lhs: FestivalDate, rhs: FestivalDate) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else {
            return lhs.day < rhs.day
        }
    }
    
    static func == (lhs: FestivalDate, rhs: FestivalDate) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
    
    static func > (lhs: FestivalDate, rhs: FestivalDate) -> Bool {
        return !(lhs < rhs)
    }
    
}

extension [FestivalDate] {
    
    var toDates: String {
        self.map({"\($0.day)th"}).joined(separator: ", ")
    }
    
}
