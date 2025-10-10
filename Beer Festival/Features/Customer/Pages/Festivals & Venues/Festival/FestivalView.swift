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
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        FestivalHeaderView(title: viewModel.title, subtitle: viewModel.subtitle, textColor: viewModel.festival.venue.colorScheme.primaryText)
                    }
                    ToolbarItem {
                        Menu {
                            Button("Add to calendar", systemImage: "calendar") {
                                
                            }
                            Button("Contact", systemImage: "envelope") {
                                
                            }
                            Button("Add to wallet", systemImage: "wallet.pass") {
                                
                            }
                        } label: {
                            Label("Options", systemImage: "ellipsis")
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(id: "tokens", placement: .bottomBar) {
                        FestivalTokensButton(tokens: viewModel.festival.tokens, textColor: viewModel.festival.venue.colorScheme.accentText) {
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
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: FestivalExamples.primary).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .toolbarTitleDisplayMode(.inline)
        }
    }
}
