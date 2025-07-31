//
//  Stamp.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

import Foundation

struct Stamp: Hashable {
    
    let id: String
    var status: StampStatus
    
    init(id: String = UUID().uuidString, status: StampStatus = .unredeemed) {
        self.id = id
        self.status = status
    }
    
}

enum StampStatus: String {
    case unredeemed
    case redeemed
    case cancelled
    case expired
}
