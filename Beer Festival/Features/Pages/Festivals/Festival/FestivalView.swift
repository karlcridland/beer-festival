//
//  FestivalView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct FestivalView: View {
    
    @ObservedObject var viewModel: FestivalViewModel
    
    init(festival: Festival) {
        _viewModel = ObservedObject(wrappedValue: FestivalViewModel(festival: festival))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundYellow)
                    
                FestivalHeaderView()
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .background(.backgroundYellow)
        }
    }
    
}

struct FestivalHeaderView: View {
    
    var body: some View {
    
    }
    
}
