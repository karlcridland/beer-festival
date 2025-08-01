//
//  StampsProtocol.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

protocol StampsProtocol {
    
    var stampsSet: Set<Stamp> { get set }
    var hasLoaded: Bool { get set }
    var remaining: Int { get }
    
    func getStamps(_ id: String, _ onComplete: @escaping (Set<Stamp>) -> Void)
    func purchaseStamps(_ numberOfStamps: Int, value: Int)
    func add(_ quantity: Int)
    func redeemStamp(_ drink: Drink) throws
    
}
