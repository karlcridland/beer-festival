//
//  HomeFeedViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import Foundation

class HomeFeedViewModel: ObservableObject {
    
    var thumbnails: [FestivalThumbView] {
        return [FestivalThumbView(), FestivalThumbView(), FestivalThumbView()]
    }
    
}
