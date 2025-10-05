//
//  FestivalDrinksWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 03/10/2025.
//

import SwiftUI

struct FestivalDrinksWidgetView: View {
    
    var festival: Festival
    
    @State private var showAll: Bool = false
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var body: some View {
        FestivalWidgetView(title: "Drinks") {
            HStack {
                ScoreCardButton(drinkCount: 0, tint: festival.venue.colorScheme?.accent ?? Color(.label), background: (festival.venue.colorScheme?.accent ?? .black).opacity(0.8))
            }
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
