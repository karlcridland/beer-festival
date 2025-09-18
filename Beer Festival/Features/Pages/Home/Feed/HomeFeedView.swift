//
//  HomeFeedView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import SwiftUI

struct HomeFeedView: View {
    
    @StateObject private var viewModel: HomeFeedViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: HomeFeedViewModel())
    }
        
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.festivals, id: \.id) { festival in
                    FestivalThumbView(festival: festival)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
