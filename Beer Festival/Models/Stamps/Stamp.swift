//
//  Token.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

import Foundation

struct Token: Hashable {
    
    let id: String
    let created: Date
    var status: TokenStatus
    var transactionId: String?
    
    init(id: String = UUID().uuidString, created: Date = Date(), status: TokenStatus = .unredeemed) {
        self.id = id
        self.created = created
        self.status = status
    }
    
    mutating func redeem() {
        status = .redeemed
    }
    
}
