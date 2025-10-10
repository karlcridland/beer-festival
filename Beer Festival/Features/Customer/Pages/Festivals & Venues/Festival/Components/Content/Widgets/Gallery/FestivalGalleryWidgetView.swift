//
//  FestivalGalleryWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI
import PhotosUI

struct FestivalGalleryWidgetView: View {
    
    var festival: Festival
    
    @State private var showImagePicker: Bool = false
    @State private var showGallery: Bool = false
    @State private var showImage: (any Hashable)?
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var pickedImage: Image?
    
    var images: [ImageResource] {
        return []
    }
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var body: some View {
        FestivalWidgetView(title: "Gallery", textColor: festival.venue.colorScheme.primaryText) {
            HStack {
                ForEach(images, id: \.self) { resource in
                    Image(resource)
                }
                PhotosPicker(selection: $selectedItem, matching: .images, preferredItemEncoding: .automatic) {
                    FestivalGalleryIconView(systemName: "camera.fill", label: "Add photo", tint: festival.venue.colorScheme.accentText, background: festival.venue.colorScheme.buttonAccent)
                        .disabled(true)
                }
                .buttonStyle(.borderless)
                FestivalGalleryIconView(systemName: "photo.on.rectangle.angled.fill", label: "View full gallery", tint: festival.venue.colorScheme.accentText, background: festival.venue.colorScheme.buttonAccent) {
                    showGallery.toggle()
                }
            }
        }
        .onChange(of: selectedItem) { oldValue, newValue in
            guard let item = newValue else { return }
            Task {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    pickedImage = Image(uiImage: uiImage)
                    showImagePicker = false
                }
            }
        }
        .navigationDestination(isPresented: $showGallery) {
            FestivalGalleryView()
        }
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: FestivalExamples.primary).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .toolbarTitleDisplayMode(.inline)
        }
    }
}
