//
//  HomeDestination.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/09/2025.
//


enum HomeDestination: String {
    
    case profile = "Profile"
    case settings = "Settings"
    case filter = "Filter"
    
    var systemImage: String {
        switch self {
        case .profile: return "person"
        case .settings: return "gear"
        case .filter: return "line.3.horizontal.decrease"
        }
    }
    
}
