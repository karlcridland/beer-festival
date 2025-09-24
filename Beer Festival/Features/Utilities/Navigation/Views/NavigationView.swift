//
//  NavigationView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/09/2025.
//

import SwiftUI
import CoreData

struct NavigationView: View {
    
    @ObservedObject var viewModel: NavigationViewModel
    @FocusState var isSearching: Bool
    
    init(search: Binding<String>) {
        _viewModel = ObservedObject(initialValue: NavigationViewModel(search: search))
    }
    
    var body: some View {
        ZStack{}
        .toolbar {
            if #available(iOS 26.0, *) {
                ToolbarItem(placement: .bottomBar) {
                    TextField("Search", text: viewModel.$search, onEditingChanged: { isEditing in
                        withAnimation {
                            viewModel.isSearching = isEditing
                        }
                    })
                    .focused($isSearching)
                    .padding(.horizontal, 10)
                }
                ToolbarSpacer(.flexible, placement: .bottomBar)
                ToolbarItem(placement: .bottomBar) {
                    if (viewModel.isSearching) {
                        Button("Close", systemImage: "xmark") {
                            isSearching = false
                            viewModel.exitSearch()
                        }
                    }
                    else {
                        Button("Settings", systemImage: "gear") {
                            viewModel.openSettings()
                        }
                    }
                }
            } else {
                ToolbarItem(placement: .bottomBar) {
                    TextField("Test", text: viewModel.$search)
                        .padding(.horizontal, 10)
                }
            }
            
        }
    }
    
}

class NavigationViewModel: ObservableObject {
    
    @Binding var search: String
    @Published var isSearching: Bool = false

    init(search: Binding<String>) {
        _search = search
    }

    func exitSearch() {
        isSearching = false
    }

    func openSettings() { }
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

