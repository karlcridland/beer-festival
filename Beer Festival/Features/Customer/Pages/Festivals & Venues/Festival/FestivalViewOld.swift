//
//  FestivalViewOld.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct FestivalViewOld: View {
    
    @ObservedObject var viewModel: FestivalViewModel
    @State var showTokensPage: Bool = false
    
    init(festival: Festival) {
        _viewModel = ObservedObject(wrappedValue: FestivalViewModel(festival: festival))
    }
    
    var body: some View {
        VStack {
            FestivalContentView(festival: viewModel.festival)
            .background(.backgroundYellow)
            .toolbar {
                ToolbarItem(id: "tokens", placement: .bottomBar) {
                    FestivalTokensButton(tokens: viewModel.festival.tokens, textColor: viewModel.festival.venue.colorScheme.accentText) {
                        showTokensPage = true
                        viewModel.festival.tokens.add()
                    }
                }
            }
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
