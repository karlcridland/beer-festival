//
//  InventoryItemProtocol.swift
//  Beer Festival
//
//  Created by Karl Cridland on 02/08/2025.
//

protocol InventoryItemProtocol: Hashable, Equatable {
    
    var drink: Drink { get }
    var maxQuantity: Int { get }
    var quantity: Int { get set }
    var status: InventoryItemStatus { get set }
    
    func add() throws
    func remove() throws
    func pause() throws
    func resume() throws
    
}
