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
    
    var festivals: [Int] = [1, 2, 3]
        
    var body: some View {
        List {
            ForEach(0..<20, id: \.self) { i in
                FestivalThumbView()
                    .frame(maxWidth: .infinity)  // 👈 expand to parent width
                    .frame(height: 120)          // example height
                    .background(.white)
                    .cornerRadius(12)
                    .shadow(radius: 2)
            }
        }
        .listRowBackground(Color.clear)
        .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
