//
//  FestivalDates.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/10/2025.
//

import Foundation

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

    var description: String {
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
    
    var timeUntil: String? {
        let cal = Calendar.current
        let now = Date()
        let upcomingDates: [Date] = self.compactMap { date in
            DateComponents(calendar: cal, year: date.year, month: date.month, day: date.day)
                .date
        }
        .filter { $0 >= cal.startOfDay(for: now) }
        .sorted()
        
        guard let target = upcomingDates.first else {
            return nil
        }
        
        let components = cal.dateComponents([.year, .month, .weekOfYear, .day], from: now, to: target)
        
        if let years = components.year, years > 0 {
            return "\(years)y"
        }
        if let months = components.month, months > 0 {
            return "\(months)mo"
        }
        if let weeks = components.weekOfYear, weeks > 0 {
            return "\(weeks)w"
        }
        if let days = components.day, days > 0 {
            return "\(days)d"
        }
        
        return "today"
    }
    
}
