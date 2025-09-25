//
//  HomeBottomNavView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/09/2025.
//

import SwiftUI
import CoreData

import SwiftUI

struct HomeBottomNavView: View {
    
    @ObservedObject var viewModel: HomeBottomNavViewModel
    @FocusState private var isSearchFieldFocused: Bool
    
    init(search: Binding<String>) {
        _viewModel = ObservedObject(initialValue: HomeBottomNavViewModel(search: search))
    }
    
    var body: some View {
        ZStack {
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                TextField("Search", text: viewModel.$search, onEditingChanged: { isEditing in
                    viewModel.isSearching = isEditing
                })
                    .focused($isSearchFieldFocused)
                    .submitLabel(.search)
                    .onSubmit { exitSearch() }
                    .padding(.horizontal, 10)
                    .id(viewModel.onRefresh)
            }
            
            if #available(iOS 26.0, *) {
                ToolbarSpacer(.flexible, placement: .bottomBar)
            }
            
            ToolbarItem(placement: .bottomBar) {
                if viewModel.isSearching {
                    Button("Close", systemImage: "xmark") {
                        exitSearch()
                    }
                } else {
                    Button("Settings", systemImage: "gear") {
                        viewModel.openSettings()
                    }
                }
            }
        }
    }
    
    func exitSearch() {
        isSearchFieldFocused = false
        viewModel.exitSearch()
    }
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
