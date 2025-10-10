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
    
    private func toDateComponents(_ date: FestivalDate) -> DateComponents {
        DateComponents(calendar: Calendar.current, year: date.year, month: date.month, day: date.day)
    }

    private func isConsecutive(_ lhs: FestivalDate, _ rhs: FestivalDate) -> Bool {
        let cal = Calendar.current
        guard let lhsDate = cal.date(from: toDateComponents(lhs)),
              let next = cal.date(byAdding: .day, value: 1, to: lhsDate),
              let rhsDate = cal.date(from: toDateComponents(rhs)) else { return false }
        return cal.isDate(next, inSameDayAs: rhsDate)
    }

    private func monthName(_ month: Int) -> String {
        let df = DateFormatter()
        df.locale = Locale.current
        let m: Int = [1, [12, month].min()!].min()! - 1
        return df.monthSymbols[m]
    }

    private func ordinal(_ day: Int) -> String {
        let mod10 = day % 10
        let mod100 = day % 100
        let suffix: String
        if mod10 == 1 && mod100 != 11 { suffix = "st" }
        else if mod10 == 2 && mod100 != 12 { suffix = "nd" }
        else if mod10 == 3 && mod100 != 13 { suffix = "rd" }
        else { suffix = "th" }
        return "\(day)\(suffix)"
    }

    var toDates: String {
        guard !self.isEmpty else { return "" }
        let sorted = self.sorted { (a, b) in
            if a.year != b.year { return a.year < b.year }
            if a.month != b.month { return a.month < b.month }
            return a.day < b.day
        }

        // Build consecutive ranges
        var ranges: [(start: FestivalDate, end: FestivalDate)] = []
        var currentStart = sorted[0]
        var currentEnd = sorted[0]

        for date in sorted.dropFirst() {
            if isConsecutive(currentEnd, date) {
                currentEnd = date
            } else {
                ranges.append((currentStart, currentEnd))
                currentStart = date
                currentEnd = date
            }
        }
        ranges.append((currentStart, currentEnd))

        let years = Set(sorted.map { $0.year })
        let multipleYears = years.count > 1

        func formatRange(_ r: (start: FestivalDate, end: FestivalDate)) -> String {
            let s = r.start
            let e = r.end
            if s == e {
                if multipleYears {
                    return "\(ordinal(s.day)) \(monthName(s.month)) \(s.year)"
                } else {
                    return "\(ordinal(s.day)) \(monthName(s.month))"
                }
            }
            
            if s.year == e.year {
                if s.month == e.month {
                    return "\(ordinal(s.day)) – \(ordinal(e.day)) \(monthName(s.month))"
                } else {
                    return "\(ordinal(s.day)) \(monthName(s.month)) – \(ordinal(e.day)) \(monthName(e.month))"
                }
            } else {
                return "\(ordinal(s.day)) \(monthName(s.month)) \(s.year) – \(ordinal(e.day)) \(monthName(e.month)) \(e.year)"
            }
        }

        return ranges.map { formatRange($0) }.joined(separator: ", ")
    }
}
