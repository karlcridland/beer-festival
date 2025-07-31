//
//  FestivalProtocol.swift
//  Beer Festival
//
//  Created by Karl Cridland on 31/07/2025.
//

protocol FestivalProtocol {
    var name: String { get }
    var location: String { get }
    var dates: [FestivalDate] { get }
}
