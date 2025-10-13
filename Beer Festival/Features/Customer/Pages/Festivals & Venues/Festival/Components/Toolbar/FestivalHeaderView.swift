//
//  FestivalHeaderView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/10/2025.
//

import SwiftUI

struct FestivalHeaderView: View {
    
    let title, subtitle: String
    let textColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.body)
                .bold()
            Text(subtitle)
                .font(.caption)
                .opacity(0.75)
        }
        .foregroundStyle(textColor)
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

