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
    @FocusState private var isSearching: Bool
    
    init() {
        _viewModel = ObservedObject(initialValue: HomeViewModel())
    }

    var body: some View {
        NavigationStack {
            VStack {
                HomeFeedView()
            }
            .id(isSearching)
            .toolbar {
                
                // Bottom left toolbar - displays when not searching
                
                if (!isSearching) {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Filter", systemImage: "line.3.horizontal.decrease") {
                            
                        }
                    }
                    ToolbarSpacer(placement: .bottomBar)
                }
                
                // Bottom center toolbar - displays always but shifts side when in use/not in use
                
                ToolbarItem(id: "Search Bar", placement: .bottomBar) {
                    TextField("Search", text: $search)
                        .focused($isSearching)
                        .padding(.horizontal, 10)
                        .submitLabel(.search)
                        .onSubmit {
                            isSearching = false
                        }
                }
                
                // Bottom right toolbar - displays when searching to cancel search
                
                if (isSearching) {
                    ToolbarSpacer(placement: .bottomBar)
                    ToolbarItem(placement: .bottomBar) {
                        Button("Close", systemImage: "xmark") {
                            isSearching = false
                        }
                    }
                }
                
                // Top right navigation - option menu adding dropdowns to helpful pages
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HomeMenuView(destinations: [.profile, .settings])
                }
                
            }
            
        }
    }
    
}

class HomeViewModel: ObservableObject {
    
    var refresh_id: String = UUID().uuidString
    
    func refresh() {
        refresh_id = UUID().uuidString
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
