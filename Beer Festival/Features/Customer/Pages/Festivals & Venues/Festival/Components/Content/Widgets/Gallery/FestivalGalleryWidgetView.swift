//
//  FestivalGalleryWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct FestivalGalleryWidgetView: View {
    
    var festival: Festival
    
    var images: [ImageResource] {
        return []
    }
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var body: some View {
        FestivalWidgetView(title: "Gallery") {
            HStack {
                ForEach(images, id: \.self) { resource in
                    Image(resource)
                }
                FestivalGalleryView(systemName: "camera.fill", label: "Add photo", background: (festival.venue.colorScheme?.accent ?? .black).opacity(0.8)) {
                    
                }
                FestivalGalleryView(systemName: "photo.on.rectangle.angled.fill", label: "View full gallery", background: (festival.venue.colorScheme?.accent ?? .black).opacity(0.8)) {
                    
                }
            }
        }
    }
    
}

#Preview {
    let showHome: Bool = !true
    if #available(iOS 26.0, *) {
        if (showHome) {
            HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        else {
            FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
