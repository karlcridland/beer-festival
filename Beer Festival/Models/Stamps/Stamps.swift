//
//  Stamps.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

class Stamps: StampsProtocol {
    
    internal var stampsSet: Set<Stamp> = []
    internal var hasLoaded: Bool = false
    
    init(id: String) {
        self.getStamps(id) { stamps in
            print(stamps)
            self.stampsSet = stamps
            self.hasLoaded = true
        }
    }
    
    func getStamps(_ id: String, _ onComplete: @escaping (Set<Stamp>) -> Void) {
        
    }
    
    func purchaseStamps(_ numberOfStamps: Int, value: Int) {
        Settings.shared.payment.purchase(stamps: numberOfStamps, value: value) {
            
        }
    }
    
    func add(_ quantity: Int = 1) {
        for _ in 0 ..< quantity {
            let stamp = Stamp()
            stampsSet.insert(stamp)
        }
    }
    
    func redeemStamp(_ drink: Drink) throws {
        let remainingStamps = stampsSet.filter { $0.status == .unredeemed }
        guard let oldest = remainingStamps.sorted(by: { $0.created < $1.created }).first else {
            throw StampsError.noRemaining
        }
        stampsSet.remove(oldest)
        var updatedStamp = oldest
        updatedStamp.redeem()
        stampsSet.insert(updatedStamp)
    }
    
    var remaining: Int {
        return stampsSet.filter { $0.status == .unredeemed }.count
    }
    
}
