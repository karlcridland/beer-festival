//
//  Settings.swift
//  Beer Festival
//
//  Created by Karl Cridland on 01/08/2025.
//

class Settings {
    
    public static let shared = Settings()
    
    let location: LocationManager = LocationManager()
    let payment: PaymentManager = PaymentManager()
    
    private init() {
        
    }
    
}
