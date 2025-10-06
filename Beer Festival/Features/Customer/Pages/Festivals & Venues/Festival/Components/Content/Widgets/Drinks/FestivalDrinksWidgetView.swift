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
        let backgroundColor: Color = (festival.venue.colorScheme?.accent ?? .black).opacity(0.8)
        FestivalWidgetView(title: "Drinks") {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ScoreCardButton(drinkCount: 0, tint: festival.venue.colorScheme?.accent ?? Color(.label), background: backgroundColor)
                        .padding(.trailing, 12)
                    
                    let drink = Drink(name: "Ease Up I.P.A.", type: .paleAle)
                    DrinkIconView(drink: drink, imageName: "ghostship", label: "Popular")
                    DrinkIconView(drink: drink, imageName: "dryhopped", label: "Best Score")
                    DrinkIconView(drink: drink, imageName: "easeup", label: "Your Fav")
                    DrinkIconView(drink: drink, imageName: "easeup", label: "View All", systemName: "checklist.unchecked", background: backgroundColor)
                }
            }
            .scrollClipDisabled()
        }
    }
    
}

struct DrinkIconView: View {
    
    let drink: Drink
    let imageName: String
    let label: String
    let size: CGFloat = 80
    
    let systemName: String?
    let background: Color?
    
    init(drink: Drink, imageName: String, label: String, systemName: String? = nil, background: Color? = nil) {
        self.drink = drink
        self.imageName = imageName
        self.label = label
        self.systemName = systemName
        self.background = background
    }
    
    var body: some View {
        VStack {
            Button {
                
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
