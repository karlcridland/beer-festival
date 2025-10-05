//
//  Tokens.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

import Foundation
import Combine
import Foundation

class Tokens: TokensProtocol, ObservableObject {
    
    @Published var tokenSet: Set<Token> = []
    internal var hasLoaded: Bool = false
    
    init(id: String) {
        self.getTokens(id) { tokens in
            DispatchQueue.main.async {
                self.tokenSet = tokens
                self.hasLoaded = true
            }
        }
    }
    
    func getTokens(_ id: String, _ onComplete: @escaping (Set<Token>) -> Void) {
        
    }
    
    func purchaseTokens(_ numberOfTokens: Int, value: Int) {
        Settings.shared.payment.purchase(tokens: numberOfTokens, value: value) {
            
        }
    }
    
    func add(_ quantity: Int = 1) {
        for _ in 0 ..< quantity {
            let token = Token()
            tokenSet.insert(token)
        }
    }
    
    func redeemToken(_ drink: Drink) throws {
        let remainingTokens = tokenSet.filter { $0.status == .unredeemed }
        guard let oldest = remainingTokens.sorted(by: { $0.created < $1.created }).first else {
            throw TokensError.noRemaining
        }
        tokenSet.remove(oldest)
        var updatedToken = oldest
        updatedToken.redeem()
        tokenSet.insert(updatedToken)
    }
    
    var remaining: Int {
        tokenSet.filter { $0.status == .unredeemed }.count
    }
    
}

