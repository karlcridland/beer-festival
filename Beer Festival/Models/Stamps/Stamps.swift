//
//  Stamps.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

class Stamps {
    
    private var stampsSet: Set<Stamp> = []
    
    init(id: String) {
        
    }
    
    func add(_ quantity: Int = 1) {
        for _ in 0 ..< quantity {
            let stamp = Stamp()
            stampsSet.insert(stamp)
        }
    }
    
    func remove(_ stamp: Stamp) {
        stampsSet.remove(stamp)
    }
    
    var nonRedeemedTokens: Int {
        return stampsSet.filter { $0.status == .unredeemed }.count
    }
    
}
