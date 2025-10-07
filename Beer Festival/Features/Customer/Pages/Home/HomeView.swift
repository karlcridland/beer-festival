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
    @State private var showsPopover: Bool = false
    
    init() {
        _viewModel = ObservedObject(initialValue: HomeViewModel())
    }
    
    var body: some View {
        NavigationStack {
            HomeFeedView()
                .searchable(text: $search, isPresented: $isSearching)
                .onChange(of: search, { oldValue, newValue in
                    print(newValue)
                })
                .onSubmit(of: .search) {
                    isSearching = false
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Filter", systemImage: "line.3.horizontal.decrease") {
                            showsPopover = true
                        }
                    }
                    ToolbarSpacer(placement: .bottomBar)
                    DefaultToolbarItem(kind: .search, placement: .bottomBar)
                
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HomeMenuView(destinations: [.profile, .settings], expand: true)
                    }
                
                }
                .popover(isPresented: $showsPopover, content: {
                    FilterView()
                })
            
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
