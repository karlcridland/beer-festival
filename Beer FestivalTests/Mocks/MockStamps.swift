//
//  MockTokens.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

import Foundation

class MockTokens: Tokens {
    
    let tokens: Int
    
    init(id: String, tokens: Int) {
        self.tokens = tokens
        super.init(id: id)
    }
    
    override func purchaseTokens(_ numberOfTokens: Int, value: Int) {
        self.add(numberOfTokens)
    }
    
    override func getTokens(_ id: String, _ onComplete: @escaping (Set<Token>) -> Void) {
        var tokens: Set<Token> = []
        for _ in 0 ..< self.tokens {
            let token: Token = Token(created: Date(), status: .unredeemed)
            tokens.insert(token)
        }
        onComplete(tokens)
    }
    
}
