//
//  FestivalListView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import SwiftUI

struct FestivalListView: View {
    
    let viewModel: FestivalListViewModel
    
    init(viewModel: FestivalListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("FestivalListView")
    }
    
}
