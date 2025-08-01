//
//  StampTests.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

import XCTest
@testable import Beer_Festival

final class StampTests: XCTestCase {
    
    func testStampsStartAtTen() throws {
        let festival = MockFestival()
        XCTAssertEqual(10, festival.stamps.remaining)
    }
    
    func testAddStamp() throws {
        let festival = MockFestival()
        let originalRemaining: Int = festival.stamps.remaining
        festival.stamps.add()
        XCTAssertEqual(originalRemaining + 1, festival.stamps.remaining)
    }
    
    func testAddFiveStamps() throws {
        let festival = MockFestival()
        let originalRemaining: Int = festival.stamps.remaining
        festival.stamps.add(5)
        XCTAssertEqual(originalRemaining + 5, festival.stamps.remaining)
    }
    
    func testTokenRedeemed() throws {
        let festival = MockFestival()
        let originalRemaining: Int = festival.stamps.remaining
        do {
            let drink: Drink = Drink(name: "test", type: .lager)
            try festival.stamps.redeemStamp(drink)
            XCTAssertEqual(originalRemaining - 1, festival.stamps.remaining)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testRedeemFailsWhenNoStampsRemaining() throws {
        let festival = MockFestival(stamps: 0)
        do {
            let drink: Drink = Drink(name: "test", type: .lager)
            try festival.stamps.redeemStamp(drink)
            XCTFail("Should have thrown error as no tokens to redeem.")
        }
        catch {
            XCTAssert(true)
        }
    }
    
}
