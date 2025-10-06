//
//  DrinkIconView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import SwiftUI

struct DrinkIconView: View {
    
    let drink: Drink
    let imageName: String
    let label: String
    let size: CGFloat = 80
    
    let systemName: String?
    let background: Color?
    
    let onClick: () -> Void
    
    init(drink: Drink, imageName: String, label: String, systemName: String? = nil, background: Color? = nil, onClick: @escaping () -> Void) {
        self.drink = drink
        self.imageName = imageName
        self.label = label
        self.systemName = systemName
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
                        .fontWeight(.semibold)
                        .padding(20)
                        .scaledToFit()
                        .background(background)
                        .clipShape(.circle)
                }
                else {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .buttonStyle(.borderless)
            Text(label)
                .font(.caption.weight(.semibold))
                .lineLimit(0)
        }
        .frame(width: size, height: size)
    }
    
}
