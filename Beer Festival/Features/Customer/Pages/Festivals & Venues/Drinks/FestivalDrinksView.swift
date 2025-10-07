//
//  FestivalDrinksView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct FestivalDrinksView: View {
    
    @ObservedObject var viewModel: FestivalDrinksViewModel
    
    @State var search: String = ""
    @State var isSearching: Bool = false
    
    init(festival: Festival, sortBy: FestivalDrinkSort) {
        _viewModel = ObservedObject(initialValue: FestivalDrinksViewModel(festival: festival, sortBy: sortBy))
    }
    
    var body: some View {
        ZStack {
            Color(viewModel.festival.venue.colorScheme?.primary ?? .backgroundDefault).ignoresSafeArea()
            List {
                ForEach(viewModel.drinks) { drink in
                    DrinkThumbnailView(drink: drink, backgroundColor: viewModel.festival.venue.colorScheme?.accent)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            }
            .id(viewModel.refreshID)
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .searchable(text: $search, isPresented: $isSearching)
            .task(id: search) {
                try? await Task.sleep(for: .milliseconds(250))
                viewModel.searchQuery = search
                viewModel.refresh()
            }
            .onSubmit(of: .search) {
                isSearching = false
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Filter", systemImage: "line.3.horizontal.decrease") {
                        // showsPopover = true
                    }
                }
                ToolbarSpacer(placement: .bottomBar)
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
            }
            .scrollContentBackground(.hidden)
        }
    }
    
}

struct DrinkThumbnailView: View {
    
    let drink: Drink
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
        .foregroundStyle(.white)
        .padding(16)
        .background(backgroundColor)
        .cornerRadius(40)
    }
}


#Preview {
    if #available(iOS 26.0, *) {
        FestivalDrinksView(festival: Festival.example, sortBy: .alphabetical).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension Double {
    
    var oneDP: String {
        String(format: "%.1f", self)
    }
    
}
