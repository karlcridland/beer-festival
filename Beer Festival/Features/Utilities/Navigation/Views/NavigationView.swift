//
//  NavigationView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct NavigationView: View {
    
    @Namespace private var namespace
    
    @State private var searchExpanded: Bool = false
    @State private var search: String = ""
    @State private var state: NavigationState = .home
    
    @FocusState private var searchFieldFocused: Bool
    
    let height: CGFloat
    
    init() {
        let uiFont = UIFont.preferredFont(forTextStyle: .body)
        self.height = uiFont.pointSize + 30
    }
    
    var body: some View {
        GlassEffectContainer(spacing: 8) {
            HStack(spacing: 8) {
                if (!searchExpanded) {
                    NavButton("house.fill", height, namespace) {
                        searchExpanded = false
                    }
                }
                TextField("Search", text: $search)
                    .padding(24)
                    .foregroundStyle(Color(.label))
                    .frame(height: height)
                    .font(.title3)
                    .glassEffect()
                    .glassEffectID("eraser", in: namespace)
                    .focused($searchFieldFocused)
                    .onChange(of: searchFieldFocused) { (_, focused) in
                        withAnimation {
                            self.searchExpanded = focused
                        }
                    }
                    
                if searchExpanded {
                    NavButton("xmark", height, namespace) {
                        searchExpanded = false
                        searchFieldFocused = false
                    }
                }
                else {
                    NavButton("ticket", height, namespace) {
                        searchExpanded = false
                    }
                }
            }
        }
        .padding(12)
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
