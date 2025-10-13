//
//  DrinkThumbnailView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/10/2025.
//

import SwiftUI

struct DrinkThumbnailView: View {
    
    let drink: Drink
    let colorScheme: VenueColorScheme
    
    @State private var isDisplayingDrink: Bool = false
    
    var body: some View {
        Button {
            isDisplayingDrink.toggle()
        } label: {
            HStack {
                let imageName = drink.name.lowercased().replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "")
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 4)
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.title3.bold())
                    Text(drink.type.rawValue)
                        .font(.caption.bold())
                    Text(drink.brewery.name)
                        .font(.caption.bold())
                }
                Spacer()
                Text("?")
                    .padding(.horizontal)
            }
        }
        .foregroundStyle(colorScheme.accentText)
        .padding(16)
        .background(colorScheme.buttonAccent)
        .cornerRadius(40)
        .navigationDestination(isPresented: $isDisplayingDrink) {
            FestivalDrinkView(drink: drink, colorScheme: colorScheme)
        }
    }
    
    var title: String {
        if let percentage = drink.percentage {
            return "\(drink.name) \(percentage.oneDP)%"
        }
        return drink.name
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalDrinksView(festival: FestivalExamples.primary, sortBy: .alphabetical).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
