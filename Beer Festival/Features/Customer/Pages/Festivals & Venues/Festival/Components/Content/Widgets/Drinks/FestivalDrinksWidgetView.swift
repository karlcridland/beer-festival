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
        let primary: Color = festival.venue.colorScheme.primaryText
        let accent: Color = festival.venue.colorScheme.accentText
        let backgroundColor: Color = festival.venue.colorScheme.buttonAccent
        FestivalWidgetView(title: "Drinks", textColor: festival.venue.colorScheme.primaryText) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 0) {
                    ScoreCardButton(drinkCount: 0, tint: backgroundColor, textColor: primary) {
                        showScoreCard = true
                    }
                        .padding(.trailing, 12)
                    
                    DrinkIconView(drink: DrinkExamples.ghostShip, label: "Popular", tint: accent, textColor: primary) {
                        sortDrinksBy = .popularity
                    }
                    DrinkIconView(drink: DrinkExamples.dryHopped, label: "Best Score", tint: accent, textColor: primary) {
                        sortDrinksBy = .bestScore
                    }
                    DrinkIconView(drink: DrinkExamples.easeUpIPA, label: "Favourite", tint: accent, textColor: primary) {
                        sortDrinksBy = .favourite
                    }
                    DrinkIconView(label: "View All", systemName: "checklist.unchecked", tint: accent, textColor: primary, background: backgroundColor) {
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
            if #available(iOS 26.0, *) {
                FestivalDrinksView(festival: festival, sortBy: sortBy)
            } else {
                FestivalDrinksViewOld(festival: festival, sortBy: sortBy)
            }
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
