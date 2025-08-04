//
//  Inventory.swift
//  Beer Festival
//
//  Created by Karl Cridland on 02/08/2025.
//

class Inventory {
    
    var items: Set<InventoryItem> = []
    
    init(id: String) {
        do {
            try self.getInventory(id: id) { items in
                self.items = items
            }
        }
        catch {
            print("Error fetching inventory: \(error)")
        }
    }
    
    func getInventory(id: String, completion: @escaping (Set<InventoryItem>) -> Void) throws {
        
    }
    
    var drinkTypes: Set<DrinkType> {
        Set(self.items.map { $0.drink.type })
    }
    
    var percentage: Double {
        let maxQuantity = items.map({ $0.maxQuantity }).reduce(0, +)
        let quantity = items.map({ $0.quantity }).reduce(0, +)
        if (maxQuantity == 0) {
            return 0.0
        }
        return Double(quantity) / Double(maxQuantity)
    }
    
}
