//
//  FestivalReview.swift
//  Beer Festival
//
//  Created by Karl Cridland on 09/10/2025.
//

import Foundation

struct FestivalReview {
    
    let date: Date
    let id, name: String
    
    var message: String
    var rating: Int
    
    init(date: Date, id: String = UUID().uuidString, name: String, message: String, rating: Int) {
        self.date = date
        self.id = id
        self.name = name
        self.message = message
        self.rating = rating
    }
    
    mutating func update(_ m: String) {
        message = m
    }
    
    mutating func update(_ r: Int) {
        rating = r
    }
    
}
