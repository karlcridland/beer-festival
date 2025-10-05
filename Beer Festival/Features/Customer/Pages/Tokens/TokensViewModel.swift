//
//  TokensViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/09/2025.
//

import Foundation

class TokensViewModel: ObservableObject {
    
    let festival: Festival
    
    init(festival: Festival) {
        self.festival = festival
    }
    
}
