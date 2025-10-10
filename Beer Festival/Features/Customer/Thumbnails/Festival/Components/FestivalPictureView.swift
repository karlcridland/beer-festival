//
//  FestivalPictureView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 18/09/2025.
//

import SwiftUI

struct FestivalPictureView: View {
    
    let id: String
    let cornerRadius: CGFloat
    let diameter: CGFloat = 80
    let ratio: CGFloat
    
    init(id: String, cornerRadius: CGFloat = 32, ratio: CGFloat = 1) {
        self.id = id
        self.cornerRadius = cornerRadius
        self.ratio = ratio
    }
    
    // Provide a Firebase Storage download URL to `imageURL` when available.
    // Example: FestivalPictureView(id: festival.id, imageURL: URL(string: "https://..."))
    let imageURL: URL? = nil
    
    private var placeholder: some View {
        ZStack {
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
            } else {
                placeholder
                    .frame(width: diameter * ratio, height: diameter)
            }
        }
        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 0)
        .clipShape(.rect)
        .cornerRadius(cornerRadius)
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
