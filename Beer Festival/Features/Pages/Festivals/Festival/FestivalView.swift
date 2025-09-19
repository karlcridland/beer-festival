//
//  FestivalView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct FestivalView: View {
    
    let viewModel: FestivalViewModel
    
    init(viewModel: FestivalViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                FestivalHeaderView()
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
    
}

struct FestivalHeaderView: View {
    
    var body: some View {
    
    }
    
}
