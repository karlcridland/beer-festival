//
//  HomeMenuView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/09/2025.
//

import SwiftUI

struct HomeMenuView: View {
    
    @State var selected: HomeDestination?
        
    private let destinations: [HomeDestination]
    private let expand: Bool
    
    init(destinations: [HomeDestination] = [.profile, .settings], expand: Bool = false) {
        self.destinations = destinations
        self.expand = expand
    }
    
    var body: some View {
        Group {
            if (expand) {
                HStack {
                    ForEach(destinations, id:\.self) { destination in
                        Button(destination.rawValue, systemImage: destination.systemImage) {
                            self.selected = destination
                        }
                    }
                }
                .padding(6)
            }
            else {
                Menu {
                    ForEach(destinations, id:\.self) { destination in
                        Button(destination.rawValue, systemImage: destination.systemImage) {
                            self.selected = destination
                        }
                    }
                } label: {
                    Label("Options", systemImage: "ellipsis")
                }
            }
        }
        .navigationDestination(item: $selected) { destination in
            switch destination {
            case .profile:
                ProfileView()
            case .settings:
                SettingsView()
            case .filter:
                FilterView()
            }
        }
    }
    
}


#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
