//
//  NavigationView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/09/2025.
//

import SwiftUI

struct NavigationView: View {
    
    @Namespace private var namespace
    
    @State private var searchExpanded: Bool = false
    @State private var search: String = ""
    @State private var state: NavigationState = .home
    
    @FocusState private var searchFieldFocused: Bool
    
    let height: CGFloat
    let gap: CGFloat = 12
    let pointSize: CGFloat = UIFont.preferredFont(forTextStyle: .body).pointSize
    
    init() {
        self.height = self.pointSize + 30
    }
    
    var body: some View {
        if #available(iOS 26.0, *) {
            GlassEffectContainer(spacing: 8) {
                HStack(spacing: gap) {
                    if !searchExpanded {
                        NavButton("house.fill", height, namespace) {
                            searchExpanded = false
                        }
                    }
                    TextField("Search", text: $search)
                        .padding(18)
                        .foregroundStyle(Color(.label))
                        .frame(height: height)
                        .font(.system(size: pointSize + 2, weight: .regular))
                        .glassEffect(.regular)
                        .glassEffectID("search", in: namespace)
                        .focused($searchFieldFocused)
                        .onChange(of: searchFieldFocused) { _, focused in
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                withAnimation {
                                    self.searchExpanded = focused
                                }
                            }
                        }

                    if searchExpanded {
                        NavButton("xmark", height, namespace) {
                            searchExpanded = false
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                searchFieldFocused = false
                            }
                        }
                    } else {
                        NavButton("ticket", height, namespace) {
                            searchExpanded = false
                        }
                    }
                }
            }
            .padding(searchFieldFocused ? gap : 30)
        }
        
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

