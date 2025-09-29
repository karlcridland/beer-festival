//
//  FestivalView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct FestivalView: View {
    
    @ObservedObject var viewModel: FestivalViewModel
    @State var showStampsPage: Bool = false
    
    init(festival: Festival) {
        _viewModel = ObservedObject(wrappedValue: FestivalViewModel(festival: festival))
    }
    
    var body: some View {
        let hasStamps: Bool = viewModel.festival.stamps.remaining > 0
        ZStack(alignment: .top) {
            if #available(iOS 26.0, *) {
                ZStack {
                    Color(.backgroundYellow)
                }
                .ignoresSafeArea(.container, edges: .bottom)
                .ignoresSafeArea(.keyboard, edges: .top)
                .background(.backgroundYellow)
                .toolbar {
                    ToolbarItem(placement: .principal, content: {
                        FestivalIconView(festival: viewModel.festival)
                    })
                    ToolbarItem(placement: .topBarTrailing) {
                        FestivalStampsButton(stamps: viewModel.festival.stamps) {
                            showStampsPage = true
                        }
                        .id(viewModel.refresh)
                    }
                }
                .buttonStyle(.glassProminent)
                .tint(.sage)
                .navigationDestination(isPresented: $showStampsPage) {
                    StampsView(festival: viewModel.festival, onRefresh: {
                        viewModel.refresh = UUID().uuidString
                        print("refreshing")
                    })
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
}

#Preview {
    FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
