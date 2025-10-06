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
        Text("Drinks\nSorted by: \(viewModel.sortBy.rawValue)")
    }
    
}

class FestivalDrinksViewModel: ObservableObject {
    
    let festival: Festival
    var sortBy: FestivalDrinkSort
    
    init(festival: Festival, sortBy: FestivalDrinkSort) {
        self.festival = festival
        self.sortBy = sortBy
    }
    
}
