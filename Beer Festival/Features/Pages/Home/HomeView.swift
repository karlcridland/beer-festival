//
//  ContentView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var search: String = ""
    @State private var isSearching = false
    
    init() {
        _viewModel = ObservedObject(initialValue: HomeViewModel())
    }
    
    var body: some View {
        NavigationStack {
            HomeFeedView()
                .searchable(text: $search, isPresented: $isSearching)
                .onSubmit(of: .search) {
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Filter", systemImage: "line.3.horizontal.decrease") {
                            
                        }
                    }
                    ToolbarSpacer(placement: .bottomBar)
                    DefaultToolbarItem(kind: .search, placement: .bottomBar)
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HomeMenuView(destinations: [.profile, .settings])
                }
                
            }
            
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
