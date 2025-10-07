//
//  FestivalView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct FestivalView: View {
    
    @ObservedObject var viewModel: FestivalViewModel
    @State var showTokensPage: Bool = false
    
    init(festival: Festival) {
        _viewModel = ObservedObject(wrappedValue: FestivalViewModel(festival: festival))
    }
    
    var body: some View {
        VStack {
            FestivalContentView(festival: viewModel.festival)
                .background(viewModel.festival.venue.colorScheme.primary)
                .navigationTitle(viewModel.title)
                .navigationSubtitle(viewModel.subtitle)
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Button("Add to calendar", systemImage: "calendar") {
                                
                            }
                            Button("Contact", systemImage: "envelope") {
                                
                            }
                        } label: {
                            Label("Options", systemImage: "ellipsis")
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(id: "tokens", placement: .bottomBar) {
                        FestivalTokensButton(tokens: viewModel.festival.tokens) {
                            showTokensPage = true
                        }
                    }
                }
                .tint(viewModel.festival.venue.colorScheme.accent)
                .buttonStyle(.glassProminent)
        }
        .navigationDestination(isPresented: $showTokensPage) {
            TokensView(festival: viewModel.festival) {
                print("test")
            }
        }
    }
    
}

#Preview {
    let showHome: Bool = !false
    if #available(iOS 26.0, *) {
        if (showHome) {
            HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        else {
            FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
