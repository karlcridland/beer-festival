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
    
    // Provide a Firebase Storage download URL to `imageURL` when available.
    // Example: FestivalPictureView(id: festival.id, imageURL: URL(string: "https://..."))
    let imageURL: URL? = nil
    
    private var placeholder: some View {
        ZStack {
            Circle().fill(.secondary)
            Image("festival_placeholder")
                .font(.system(size: diameter * 0.4, weight: .regular))
                .foregroundStyle(.white.opacity(0.85))
        }
    }
    
    var body: some View {
        Group {
            if let imageURL {
                // TODO: Replace with Firebase Storage download URL when available
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        placeholder
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        placeholder
                    @unknown default:
                        placeholder
                    }
                }
                .frame(width: diameter, height: diameter)
                .clipShape(Circle())
            } else {
                placeholder
                    .frame(width: diameter, height: diameter)
                    .background(Circle().fill(.secondary))
                    .clipShape(Circle())
            }
        }
        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 0)
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
