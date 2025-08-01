//
//  MockStamps.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

import Foundation

class MockStamps: Stamps {
    
    let stamps: Int
    
    init(id: String, stamps: Int) {
        self.stamps = stamps
        super.init(id: id)
    }
    
    override func purchaseStamps(_ numberOfStamps: Int, value: Int) {
        self.add(numberOfStamps)
    }
    
    override func getStamps(_ id: String, _ onComplete: @escaping (Set<Stamp>) -> Void) {
        var stamps: Set<Stamp> = []
        for _ in 0 ..< self.stamps {
            let stamp: Stamp = Stamp(created: Date(), status: .unredeemed)
            stamps.insert(stamp)
        }
        onComplete(stamps)
    }
    
}
