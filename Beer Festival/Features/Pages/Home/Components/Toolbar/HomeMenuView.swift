//
//  HomeMenuView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/09/2025.
//

import SwiftUI

struct HomeMenuView: View {
    
    private let destinations: [HomeDestination]
    @State var selected: HomeDestination?
    
    init(destinations: [HomeDestination]) {
        self.destinations = destinations
    }
    
    var body: some View {
        Menu {
            ForEach(destinations, id:\.self) { destination in
                Button(destination.rawValue, systemImage: destination.systemImage) {
                    self.selected = destination
                }
            }
        } label: {
            Label("Options", systemImage: "ellipsis")
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
