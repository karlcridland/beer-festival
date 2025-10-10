//
//  DrinkThumbnailView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/10/2025.
//

import SwiftUI

struct DrinkThumbnailView: View {
    
    let drink: Drink
    let textColor: Color
    let backgroundColor: Color?
    
    var body: some View {
        HStack {
            let imageName = drink.name.lowercased().replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "")
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .padding(.trailing, 4)
            VStack(alignment: .leading, spacing: 0) {
                Text(drink.name)
                    .font(.title3.bold())
                Text(drink.type.rawValue)
                    .font(.caption.bold())
                Text(drink.brewery.name)
                    .font(.caption.bold())
            }
            Spacer()
            if let p = drink.percentage {
                Text("\(p.oneDP)%")
                    .font(.title3.bold())
                    .padding(.trailing, 12)
            }
            
        }
        .foregroundStyle(textColor)
        .padding(16)
        .background(backgroundColor)
        .cornerRadius(40)
    }
}
