//
//  InventoryTests.swift
//  Beer Festival
//
//  Created by Karl Cridland on 02/08/2025.
//

import XCTest
@testable import Beer_Festival

final class InventoryTests: XCTestCase {
    
    private func getStock(max: Int = 10, initial: Int = 5) -> InventoryItem? {
        let festival: MockFestival = MockFestival(maxQuantity: max, initialStock: initial)
        if let lowestStockItem = (festival.inventory as? MockInventory)?.lowestStock() {
            return lowestStockItem
        }
        XCTFail("Should have found a stock item.")
        return nil
    }
    
    func testAddStock() throws {
        if let stockItem = self.getStock() {
            let initialStock = stockItem.quantity
            try? stockItem.add()
            XCTAssert(stockItem.quantity == initialStock + 1)
        }
    }
    
    func testRemoveStock() throws {
        if let stockItem = self.getStock() {
            let initialStock = stockItem.quantity
            try? stockItem.remove()
            XCTAssert(stockItem.quantity == initialStock - 1)
        }
    }
    
    func testRemoveFromEmptyStockCausesError() throws {
        if let stockItem = self.getStock(initial: 0) {
            XCTAssertThrowsError(try stockItem.remove()) { error in
                XCTAssertEqual(error as? InventoryError, .outOfStock)
            }
        }
    }
    
    func testAddToFullStockCausesError() throws {
        if let stockItem = self.getStock(max: 10, initial: 10) {
            XCTAssertThrowsError(try stockItem.add()) { error in
                XCTAssertEqual(error as? InventoryError, .tooMuchStock)
            }
        }
    }
    
    func testItemPercentage() throws {
        if let stockItem = self.getStock(max: 10, initial: 5) {
            XCTAssertTrue(stockItem.percentage == 0.5, "Percentage matches expected value!")
        }
    }
    
}
