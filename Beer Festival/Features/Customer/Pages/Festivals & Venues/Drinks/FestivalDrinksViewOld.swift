//
//  FestivalDrinksViewOld.swift
//  Beer Festival
//
//  Created by Karl Cridland on 07/10/2025.
//

import SwiftUI

struct FestivalDrinksViewOld: View {
    
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
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Filter", systemImage: "line.3.horizontal.decrease") {
//                        showsPopover = true
                    }
                }
            }
            .searchable(text: $search, isPresented: $isSearching)
            .onChange(of: search, { oldValue, newValue in
                print(newValue)
            })
            .onSubmit(of: .search) {
                isSearching = false
            }
            .scrollContentBackground(.hidden)
        }
    }
    
}
