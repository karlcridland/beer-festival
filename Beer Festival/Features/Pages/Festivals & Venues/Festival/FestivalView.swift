//
//  FestivalView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct FestivalView: View {
    
    @ObservedObject var viewModel: FestivalViewModel
    
    init(festival: Festival) {
        _viewModel = ObservedObject(wrappedValue: FestivalViewModel(festival: festival))
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
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
                    Button {
                        // TODO: Handle action for the nav bar button
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
    }
    
}

#Preview {
    FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
