//
//  ScoreCardButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import SwiftUI

struct ScoreCardButton: View {
    
    let drinkCount: Int
    let tint, textColor: Color
    let size: CGFloat = 60
    let onClick: () -> Void
    
    var body: some View {
        VStack {
            Button {
                onClick()
            } label: {
                CircularProgressGapView(
                    progress: 0.2,
                    progressColor: tint,
                    iconColor: textColor,
                    centerContent: {
                        AnyView(Image(systemName: "checklist")
                            .foregroundStyle(textColor)
                            .font(.title2.weight(.semibold)))
                        
                    }
                )
                .frame(width: size, height: size)
            }
            .buttonStyle(.borderless)
            Text("View All")
                .foregroundStyle(textColor)
                .font(.caption.weight(.semibold))
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

