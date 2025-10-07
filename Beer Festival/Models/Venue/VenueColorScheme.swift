//
//  VenueColorScheme.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct VenueColorScheme: Hashable {
    
    let id: String = UUID().uuidString
    let primary, accent, primaryText, accentText: Color
    
    enum TextColor: String {
        case white = "ffffff"
        case black = "000000"
    }
    
    init(primary: String, accent: String, primaryText: TextColor = .white, accentText: TextColor = .white) {
        self.primary = Color(hex: primary)
        self.accent = Color(hex: accent)
        self.primaryText = Color(hex: primaryText.rawValue)
        self.accentText = Color(hex: accentText.rawValue)
    }
    
    var buttonAccent: Color {
        return accent.opacity(0.8)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b, a: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (
                ((int >> 8) * 17),
                ((int >> 4 & 0xF) * 17),
                ((int & 0xF) * 17),
                255
            )
        case 6: // RGB (24-bit)
            (r, g, b, a) = (
                (int >> 16) & 0xFF,
                (int >> 8) & 0xFF,
                int & 0xFF,
                255
            )
        case 8: // RGBA (32-bit)
            (r, g, b, a) = (
                (int >> 24) & 0xFF,
                (int >> 16) & 0xFF,
                (int >> 8) & 0xFF,
                int & 0xFF
            )
        default:
            (r, g, b, a) = (1, 1, 1, 1) // fallback = white
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
