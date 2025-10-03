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
    @State var showStampsPage: Bool = false
    
    init(festival: Festival) {
        _viewModel = ObservedObject(wrappedValue: FestivalViewModel(festival: festival))
    }
    
    var body: some View {
        VStack {
            FestivalContentView(festival: viewModel.festival)
            .background(.backgroundYellow)
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
                    FestivalStampsButton(stamps: viewModel.festival.stamps) {
                        showStampsPage = true
                    }
                }
            }
            .buttonStyle(.glassProminent)
        }
        .navigationDestination(isPresented: $showStampsPage) {
            StampsView(festival: viewModel.festival) {
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
