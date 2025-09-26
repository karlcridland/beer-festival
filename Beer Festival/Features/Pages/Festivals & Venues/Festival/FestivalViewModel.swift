//
//  FestivalViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import Foundation

class FestivalViewModel: ObservableObject {
    
    let festival: Festival
    
    init(festival: Festival) {
        self.festival = festival
    }
    
}
