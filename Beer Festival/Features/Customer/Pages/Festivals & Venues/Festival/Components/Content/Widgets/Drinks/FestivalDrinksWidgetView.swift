//
//  FestivalDrinksWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 03/10/2025.
//

import SwiftUI

struct FestivalDrinksWidgetView: View {
    
    var festival: Festival
    
    @State private var sortDrinksBy: FestivalDrinkSort?
    @State private var showScoreCard: Bool = false
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var body: some View {
        let backgroundColor: Color = (festival.venue.colorScheme?.accent ?? .black).opacity(0.8)
        FestivalWidgetView(title: "Drinks") {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ScoreCardButton(drinkCount: 0, tint: festival.venue.colorScheme?.accent ?? Color(.label), background: backgroundColor) {
                        showScoreCard = true
                    }
                        .padding(.trailing, 12)
                    
                    let drink = Drink(name: "Ease Up I.P.A.", type: .paleAle)
                    DrinkIconView(drink: drink, imageName: "ghostship", label: "Popular") {
                        sortDrinksBy = .popularity
                    }
                    DrinkIconView(drink: drink, imageName: "dryhopped", label: "Best Score") {
                        sortDrinksBy = .bestScore
                    }
                    DrinkIconView(drink: drink, imageName: "easeup", label: "Your Fav") {
                        sortDrinksBy = .favourite
                    }
                    DrinkIconView(drink: drink, imageName: "easeup", label: "View All", systemName: "checklist.unchecked", background: backgroundColor) {
                        sortDrinksBy = .alphabetical
                    }
                }
            }
            .scrollClipDisabled()
        }
        .navigationDestination(isPresented: $showScoreCard) {
            ScoreCardView(festival: festival)
        }
        .navigationDestination(item: $sortDrinksBy) { sortBy in
            FestivalDrinksView(festival: festival, sortBy: sortBy)
        }
    }
    
}

#Preview {
    let showHome: Bool = !true
    if #available(iOS 26.0, *) {
        if (showHome) {
            HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        else {
            FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
