//
//  FestivalContentViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 03/10/2025.
//

import Combine

class FestivalContentViewModel: ObservableObject {
    
    let festival: Festival
    
    init(festival: Festival) {
        self.festival = festival
    }
    
}
 
