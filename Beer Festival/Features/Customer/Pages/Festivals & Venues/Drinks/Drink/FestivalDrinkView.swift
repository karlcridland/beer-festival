//
//  FestivalDrinkView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/10/2025.
//

import SwiftUI

struct FestivalDrinkView: View {
    
    @ObservedObject var viewModel: FestivalDrinkViewModel
    @State private var isRating: Bool = false
    @State private var userRating: Int = 0
    
    private let colorScheme: VenueColorScheme
    
    init(drink: Drink, colorScheme: VenueColorScheme) {
        _viewModel = ObservedObject(initialValue: FestivalDrinkViewModel(drink: drink))
        self.colorScheme = colorScheme
    }
    
    var body: some View {
        ZStack {
            Color(colorScheme.primary).ignoresSafeArea()
            
            VStack {
                CircularProgressGapView(
                    progress: isRating ? viewModel.userScore : viewModel.averageScore,
                    lineWidth: 16,
                    progressColor: colorScheme.primaryText,
                    iconColor: colorScheme.primary,
                    bottomContent: {
                        AnyView(
                            VStack {
                                Text("\((viewModel.averageScore * 5).oneDP) / 5")
                                    .font(.body.weight(.bold))
                                Text("average")
                                    .font(.caption)
                            }
                                .multilineTextAlignment(.center)
                        )
                    },
                    centerContent: {
                        AnyView(Image(viewModel.drink.name.lowercased().replacingOccurrences(of: " ", with: ""))
                            .resizable()
                            .frame(maxWidth: 120, maxHeight: 120)
                            .aspectRatio(1, contentMode: .fit))
                    })
                    .frame(maxWidth: 240)
                    .padding()
                if (isRating) {
                    Spacer()
                    DrinkRaterView(color: colorScheme.primaryText, rating: $userRating) {
                        viewModel.updateScore(to: userRating)
                    }
                    .padding(.bottom, 40)
                }
                else {
                    if let description = viewModel.drink.description {
                        Text(description)
                            .font(.body.weight(.medium))
                            .padding(.horizontal, 24)
                            .frame(maxWidth: 400)
                    }
                    Spacer(minLength: 40)
                }
            }
        }
        .foregroundStyle(colorScheme.primaryText)
        .toolbar {
            ToolbarItem(placement: .principal) {
                FestivalHeaderView(title: viewModel.headerTitle, subtitle: viewModel.headerSubtitle, textColor: colorScheme.primaryText)
            }
            ToolbarItem(placement: .bottomBar) {
                Button {
                    withAnimation {
                        isRating.toggle()
                    }
                } label: {
                    Text(isRating ? (userRating > 0 ? "Save" : "Cancel") : "Rate Drink")
                        .font(.body.weight(.semibold))
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(isRating)
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            let drink: Drink = DrinkExamples.ghostShip
            let festival: Festival = FestivalExamples.adnams
            FestivalDrinkView(drink: drink, colorScheme: festival.venue.colorScheme).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
