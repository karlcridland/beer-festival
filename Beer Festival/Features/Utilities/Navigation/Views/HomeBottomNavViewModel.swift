//
//  HomeBottomNavViewModel.swift
//  Beer Festival
//
//  Created by Karl Cridland on 25/09/2025.
//

import SwiftUI

class HomeBottomNavViewModel: ObservableObject {
    
    @Binding var search: String
    @Published var isSearching: Bool = false
    
    var onRefresh: String = UUID().uuidString

    init(search: Binding<String>) {
        _search = search
    }

    func exitSearch() {
        isSearching = false
        refresh()
    }

    func openSettings() { }
    
    func refresh() {
        onRefresh = UUID().uuidString
    }
    
}
