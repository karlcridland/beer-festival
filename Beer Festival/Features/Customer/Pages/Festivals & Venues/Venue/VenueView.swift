//
//  VenueView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 25/09/2025.
//

import SwiftUI

struct VenueView: View {
    
    @ObservedObject var viewModel: VenueViewModel
    
    init(venue: Venue) {
        _viewModel = ObservedObject(wrappedValue: VenueViewModel(venue: venue))
    }
    
    var body: some View {
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
