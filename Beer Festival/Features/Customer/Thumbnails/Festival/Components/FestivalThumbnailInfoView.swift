//
//  FestivalThumbnailInfoView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/10/2025.
//

import SwiftUI

struct FestivalThumbnailInfoView: View {
    
    let value: String?
    let systemName: String?
    let label: String
    let cornerRadius: CGFloat
    
    init(value: String?, label: String, cornerRadius: CGFloat) {
        self.value = value
        self.systemName = nil
        self.label = label
        self.cornerRadius = cornerRadius
    }
    
    init(systemName: String?, label: String, cornerRadius: CGFloat) {
        self.value = nil
        self.systemName = systemName
        self.label = label
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        VStack {
            Spacer()
            if let value = value {
                Text(value)
                    .fontWeight(.bold)
            } else if let systemName = systemName {
                Image(systemName: systemName)
            }
            Spacer()
            Text(label)
                .font(Font.caption)
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: 80)
        .padding(4)
        .background(Color(.systemGray))
        .cornerRadius(cornerRadius)
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

