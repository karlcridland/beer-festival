//
//  Stamp.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

import Foundation

struct Stamp: Hashable {
    
    let id: String
    let created: Date
    var status: StampStatus
    var transactionId: String?
    
    init(id: String = UUID().uuidString, created: Date = Date(), status: StampStatus = .unredeemed) {
        self.id = id
        self.created = created
        self.status = status
    }
    
    mutating func redeem() {
        status = .redeemed
    }
    
}
