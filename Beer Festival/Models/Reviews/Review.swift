//
//  Review.swift
//  Beer Festival
//
//  Created by Karl Cridland on 09/10/2025.
//

import Foundation

struct Review {
    
    let date: Date
    let id, name, message: String
    let rating: Int
    
    init(date: Date, id: String = UUID().uuidString, name: String, message: String, rating: Int) {
        self.date = date
        self.id = id
        self.name = name
        self.message = message
        self.rating = rating
    }
    
}
