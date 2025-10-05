//
//  FestivalGalleryView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct FestivalGalleryView: View {
    
    let imageResource: ImageResource?
    let systemName: String?
    let label: String
    let background: Color
    let onClick: () -> Void
    
    init(imageResource: ImageResource? = nil, systemName: String? = nil, label: String, background: Color = .clear, onClick: @escaping () -> Void) {
        self.imageResource = imageResource
        self.systemName = systemName
        self.label = label
        self.background = background
        self.onClick = onClick
    }
    
    var body: some View {
        Button {
            onClick()
        } label: {
            if let systemName = systemName {
                Image(systemName: systemName)
                    .font(.title2.weight(.semibold))
            } else if let imageResource = imageResource {
                Image(imageResource)
            } else {
                Text("view all")
                    .fontWeight(.semibold)
                    .padding(4)
            }
        }
        .frame(width: 80, height: 80)
        .background(background)
        .cornerRadius(20)
        .buttonStyle(.borderless)
    }
    
}
