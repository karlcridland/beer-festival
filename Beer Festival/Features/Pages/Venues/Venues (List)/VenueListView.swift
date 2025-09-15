//
//  VenueListView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import SwiftUI

struct VenueListView: View {
    
    let viewModel: VenueListViewModel
    
    init(viewModel: VenueListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("VenueListView")
    }
    
}
