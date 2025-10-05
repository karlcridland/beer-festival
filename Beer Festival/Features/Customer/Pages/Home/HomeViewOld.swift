//
//  HomeViewOld.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/09/2025.
//

import SwiftUI

struct HomeViewOld: View {
    
    @State var search: String = ""

    var body: some View {
        NavigationStack {
            HomeFeedView()
                .background(.backgroundYellow)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Search", systemImage: "magnifyingglass") {
                            
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HomeMenuView(destinations: [.profile, .filter, .settings])
                    }
                }
                .tint(Color(.label))
        }
    }
    
}
