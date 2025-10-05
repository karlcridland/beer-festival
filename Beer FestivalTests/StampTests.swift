//
//  TokenTests.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

import XCTest
@testable import Beer_Festival

final class TokenTests: XCTestCase {
    
    func testTokensStartAtTen() throws {
        let festival = MockFestival()
        XCTAssertEqual(10, festival.tokens.remaining)
    }
    
    func testAddToken() throws {
        let festival = MockFestival()
        let originalRemaining: Int = festival.tokens.remaining
        festival.tokens.add()
        XCTAssertEqual(originalRemaining + 1, festival.tokens.remaining)
    }
    
    func testAddFiveTokens() throws {
        let festival = MockFestival()
        let originalRemaining: Int = festival.tokens.remaining
        festival.tokens.add(5)
        XCTAssertEqual(originalRemaining + 5, festival.tokens.remaining)
    }
    
    func testTokenRedeemed() throws {
        let festival = MockFestival()
        let originalRemaining: Int = festival.tokens.remaining
        do {
            let drink: Drink = Drink(name: "test", type: .lager)
            try festival.tokens.redeemToken(drink)
            XCTAssertEqual(originalRemaining - 1, festival.tokens.remaining)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testRedeemFailsWhenNoTokensRemaining() throws {
        let festival = MockFestival(tokens: 0)
        do {
            let drink: Drink = Drink(name: "test", type: .lager)
            try festival.tokens.redeemToken(drink)
            XCTFail("Should have thrown error as no tokens to redeem.")
        }
        catch {
            XCTAssert(true)
        }
    }
    
}
