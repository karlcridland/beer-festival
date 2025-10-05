//
//  TokensProtocol.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

protocol TokensProtocol {
    
    var tokenSet: Set<Token> { get set }
    var hasLoaded: Bool { get set }
    var remaining: Int { get }
    
    func getTokens(_ id: String, _ onComplete: @escaping (Set<Token>) -> Void)
    func purchaseTokens(_ numberOfTokens: Int, value: Int)
    func add(_ quantity: Int)
    func redeemToken(_ drink: Drink) throws
    
}
