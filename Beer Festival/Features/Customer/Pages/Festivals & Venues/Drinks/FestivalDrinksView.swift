//
//  FestivalDrinksView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import SwiftUI

struct FestivalDrinksView: View {
    
    @ObservedObject var viewModel: FestivalDrinksViewModel
    
    init(festival: Festival, sortBy: FestivalDrinkSort) {
        _viewModel = ObservedObject(initialValue: FestivalDrinksViewModel(festival: festival, sortBy: sortBy))
    }
    
    var body: some View {
        ZStack {
            Color(viewModel.festival.venue.colorScheme?.primary ?? .backgroundDefault).ignoresSafeArea()
            List {
                ForEach(viewModel.drinks){ drink in
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
                    .foregroundStyle(.white)
                    .padding(16)
                    .background(viewModel.festival.venue.colorScheme?.accent)
                    .cornerRadius(40)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color(.clear))
            }
            .scrollContentBackground(.hidden)
        }
    }
    
}


#Preview {
    FestivalDrinksView(festival: Festival.example, sortBy: .alphabetical).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

extension Double {
    
    var oneDP: String {
        String(format: "%.1f", self)
    }
    
}
