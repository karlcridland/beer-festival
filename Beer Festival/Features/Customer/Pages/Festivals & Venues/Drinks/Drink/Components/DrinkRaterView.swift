//
//  DrinkRaterView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/10/2025.
//

import SwiftUI

struct DrinkRaterView: View {
    
    let color: Color
    @Binding var rating: Int
    let onUpdate: () -> Void
    
    var body: some View {
        HStack {
            ForEach(1 ..< 6) { i in
                Button {
                    rating = i
                    onUpdate()
                } label: {
                    Image(systemName: "star.fill")
                        .font(.title.bold())
                        .foregroundStyle(color)
                        .opacity(rating < i ? 0.3 : 1)
                        .padding(5)
                }
            }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            let drink: Drink = DrinkExamples.easeUpIPA
            let festival: Festival = FestivalExamples.primary
            FestivalDrinkView(drink: drink, colorScheme: festival.venue.colorScheme).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
