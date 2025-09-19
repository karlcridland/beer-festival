//
//  FestivalPictureView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 18/09/2025.
//

import SwiftUI

struct FestivalPictureView: View {
    
    let id: String
    let diameter: CGFloat = 64
    
    var body: some View {
        Circle()
            .fill(.secondary)
            .frame(width: diameter, height: diameter)
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 0)
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

