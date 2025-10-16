//
//  FestivalGalleryViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/10/2025.
//

import Combine

class FestivalGalleryViewModel: ObservableObject {
    
    private let festival: Festival
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var getImages: [FestivalImage] {
        []
    }
    
}

struct FestivalImage {
    
}
