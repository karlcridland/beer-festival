//
//  HomeBottomNavView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/09/2025.
//

import SwiftUI
import CoreData

struct HomeBottomNavView: View {
    
    @StateObject var viewModel: HomeBottomNavViewModel
    @FocusState private var isSearchFieldFocused: Bool
    @State var isSettingsOpen: Bool = false
    @State var isProfileOpen: Bool = false
    
    init(search: Binding<String>) {
        _viewModel = StateObject(wrappedValue: HomeBottomNavViewModel(search: search))
    }
    
    var body: some View {
        ZStack {
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ToolbarButton(label: "Profile", systemImage: "person.fill", shouldAppear: !viewModel.isSearching) {
                    isProfileOpen = true
                }
            }
            
            if #available(iOS 26.0, *) {
                ToolbarSpacer(.flexible, placement: .bottomBar)
            }
            
            ToolbarItem(placement: .bottomBar) {
                TextField("Search", text: viewModel.$search, onEditingChanged: { isEditing in
                    withAnimation {
                        viewModel.isSearching = true
                    }
                })
                    .focused($isSearchFieldFocused)
                    .submitLabel(.done)
                    .onSubmit { exitSearch() }
                    .padding(.horizontal, 10)
                    .foregroundStyle(Color(.label))
                    .tint(Color(.label))
            }
            
            if #available(iOS 26.0, *) {
                ToolbarSpacer(.flexible, placement: .bottomBar)
            }
            
            ToolbarItem(placement: .bottomBar) {
                ToolbarButton(label: "Settings", systemImage: "gear", shouldAppear: !viewModel.isSearching) {
                    isSettingsOpen = true
                }
            }
        }
        .foregroundStyle(Color(.label))
        .tint(Color(.label))
        .navigationDestination(isPresented: $isProfileOpen) {
            ProfileView()
        }
        .navigationDestination(isPresented: $isSettingsOpen) {
            SettingsView()
        }
    }
    
    func exitSearch() {
        withAnimation {
            isSearchFieldFocused = false
            viewModel.exitSearch()
        }
    }
}

struct ToolbarButton: View {
    
    let label, systemImage: String
    var shouldAppear: Bool
    var onClick: () -> Void
    
    init(label: String, systemImage: String, shouldAppear: Bool = true, onClick: @escaping () -> Void) {
        self.label = label
        self.systemImage = systemImage
        self.shouldAppear = shouldAppear
        self.onClick = onClick
    }
    
    var body: some View {
        if shouldAppear {
            Button(label, systemImage: systemImage) {
                onClick()
            }
            .foregroundStyle(Color(.label))
            .tint(Color(.label))
        }
    }
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
