//
//  DrinkIconView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import SwiftUI

struct DrinkIconView: View {
    
    let drink: Drink?
    let label: String
    let size: CGFloat = 80
    
    let systemName: String?
    let tint, textColor: Color
    let background: Color?
    
    let onClick: () -> Void
    
    init(drink: Drink? = nil, label: String, systemName: String? = nil, tint: Color, textColor: Color, background: Color? = nil, onClick: @escaping () -> Void) {
        self.drink = drink
        self.label = label
        self.systemName = systemName
        self.tint = tint
        self.textColor = textColor
        self.background = background
        self.onClick = onClick
    }
    
    var body: some View {
        VStack {
            Button {
                onClick()
            } label: {
                if let systemName = systemName, let background = background {
                    Image(systemName: systemName)
                        .resizable()
                        .foregroundStyle(tint)
                        .fontWeight(.semibold)
                        .padding(20)
                        .scaledToFit()
                        .background(background)
                        .clipShape(.circle)
                }
                else if let imageName = drink?.name.lowercased().replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "") {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .buttonStyle(.borderless)
            Spacer()
            Text(label)
                .foregroundStyle(textColor)
                .font(.caption.weight(.semibold))
                .lineLimit(0)
        }
        .frame(width: size, height: size)
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
