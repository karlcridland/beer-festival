//
//  InventoryItem.swift
//  Beer Festival
//
//  Created by Karl Cridland on 02/08/2025.
//

// Wrapper class for a drink to 

class InventoryItem: InventoryItemProtocol {
    
    let drink: Drink
    let maxQuantity: Int
    var quantity: Int
    var status: InventoryItemStatus
    
    init(drink: Drink, maxQuantity: Int, quantity: Int, status: InventoryItemStatus = .inStock) {
        self.drink = drink
        self.maxQuantity = maxQuantity
        self.quantity = quantity
        self.status = quantity == 0 ? .outOfStock : status
    }
    
    func add() throws {
        if quantity == maxQuantity {
            throw InventoryError.tooMuchStock
        }
        self.quantity += 1
        self.status = .inStock
    }
    
    func remove() throws {
        if quantity <= 0 || self.status == .outOfStock {
            throw InventoryError.outOfStock
        }
        self.quantity -= 1
        if (quantity == 0) {
            self.status = .outOfStock
        }
    }
    
    func pause() throws {
        if quantity <= 0 {
            throw InventoryError.outOfStock
        }
        self.status = .onHold
    }
    
    func resume() throws {
        if quantity <= 0 {
            throw InventoryError.outOfStock
        }
        self.status = .inStock
    }
    
    var id: String {
        self.drink.id
    }
    
    var percentage: Double {
        if (maxQuantity == 0) {
            return 0.0
        }
        return Double(quantity) / Double(maxQuantity)
    }
    
    static func ==(lhs: InventoryItem, rhs: InventoryItem) -> Bool {
        lhs.id == rhs.id
    }
    
    static func !=(lhs: InventoryItem, rhs: InventoryItem) -> Bool {
        !(lhs == rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
