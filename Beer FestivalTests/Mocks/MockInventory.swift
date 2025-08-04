//
//  MockInventory.swift
//  Beer Festival
//
//  Created by Karl Cridland on 02/08/2025.
//

class MockInventory: Inventory {
    
    private let maxQuantity, initialStock: Int
    
    init(id: String, maxQuantity: Int, initialStock: Int) {
        self.maxQuantity = maxQuantity
        self.initialStock = initialStock
        super.init(id: id)
    }
    
    override func getInventory(id: String, completion: @escaping (Set<InventoryItem>) -> Void) throws {
        let drink1 = Drink(name: "Test", type: .ale)
        let item1 = InventoryItem(drink: drink1, maxQuantity: maxQuantity, quantity: initialStock)
        completion([item1])
    }
    
    func lowestStock() -> InventoryItem? {
        return self.items.min(by: { $0.quantity < $1.quantity })
    }
    
}
