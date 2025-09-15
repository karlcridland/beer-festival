//
//  HomeFeedView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import SwiftUI

struct HomeFeedView: View {
    
    let viewModel: HomeFeedViewModel
    
    init(viewModel: HomeFeedViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("HomeFeedView")
    }
    
}
