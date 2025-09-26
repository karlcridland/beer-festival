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
        ZStack(alignment: .top) {
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
                    FestivalStampsButton {
                        showStampsPage = true
                    }
                }
            }
            .navigationDestination(isPresented: $showStampsPage) {
                StampsView(festival: viewModel.festival)
            }
        }
    }
    
}

#Preview {
    FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
