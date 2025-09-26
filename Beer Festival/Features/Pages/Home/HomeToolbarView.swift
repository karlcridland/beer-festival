//
//  HomeToolbarView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/09/2025.
//

import SwiftUI
import CoreData

struct HomeToolbarView: View {
    
    @FocusState private var isSearchFieldFocused: Bool
    @State var isSearching: Bool = false
    
    @State var isSettingsOpen: Bool = false
    @State var isProfileOpen: Bool = false
    
    @Binding var search: String
    
    init(search: Binding<String>) {
        _search = search
    }
    
    var body: some View {
        ZStack {
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ToolbarButton(label: "Profile", systemImage: "person.fill", shouldAppear: !isSearching) {
                    isProfileOpen = true
                    exitSearch()
                }
            }
            
            if #available(iOS 26.0, *), !isSearching {
                ToolbarSpacer(.flexible, placement: .bottomBar)
            }
            
            ToolbarItem(placement: .bottomBar) {
                TextField("Search", text: $search, onEditingChanged: { isEditing in
                    withAnimation {
                        isSearching = true
                    }
                })
                    .focused($isSearchFieldFocused)
                    .submitLabel(.done)
                    .onSubmit { exitSearch() }
                    .padding(.horizontal, 10)
                    .foregroundStyle(Color(.label))
                    .tint(Color(.label))
                    .frame(maxWidth: .infinity)
            }
            
            if #available(iOS 26.0, *) {
                ToolbarSpacer(.flexible, placement: .bottomBar)
            }
            
            ToolbarItem(placement: .bottomBar) {
                ToolbarButton(label: "Settings", systemImage: "gear", shouldAppear: !isSearching) {
                    isSettingsOpen = true
                    exitSearch()
                }
                ToolbarButton(label: "Close search", systemImage: "xmark", shouldAppear: isSearching) {
                    isSearching = false
                    isSearchFieldFocused = false
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
            isSearching = false
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
