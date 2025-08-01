//
//  FestivalTests.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

import XCTest
@testable import Beer_Festival

final class FestivalTests: XCTestCase {
    
    func testFestivalInDate() {
        let today = FestivalDate(from: Date())
        let festival = MockFestival(dates: [today])
        XCTAssertTrue(festival.isInDateRange)
    }
    
    func testFestivalMarkedAsAttending() {
        let festival = MockFestival()
        let originalAttendance = festival.attendance
        festival.updateAttendance(to: .attending)
        let finalAttendance = festival.attendance
        XCTAssertTrue(originalAttendance == .notAttending && finalAttendance == .attending)
    }
    
}
