//
//  FestivalGalleryIconView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct FestivalGalleryIconView: View {
    
    let imageResource: ImageResource?
    let systemName: String?
    let label: String
    let tint: Color
    let background: Color
    let onClick: (() -> Void)?
    
    init(imageResource: ImageResource? = nil, systemName: String? = nil, label: String, tint: Color, background: Color = .clear, onClick: @escaping () -> Void) {
        self.imageResource = imageResource
        self.systemName = systemName
        self.label = label
        self.tint = tint
        self.background = background
        self.onClick = onClick
    }
    
    init(imageResource: ImageResource? = nil, systemName: String? = nil, label: String, tint: Color, background: Color = .clear) {
        self.imageResource = imageResource
        self.systemName = systemName
        self.label = label
        self.tint = tint
        self.background = background
        self.onClick = nil
    }
    
    var body: some View {
        Button {
            onClick?()
        } label: {
            if let systemName = systemName {
                Image(systemName: systemName)
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(tint)
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
