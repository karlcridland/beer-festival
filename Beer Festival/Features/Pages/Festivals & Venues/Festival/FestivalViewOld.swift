//
//  FestivalViewOld.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct FestivalViewOld: View {
    
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
                ToolbarItem(id: "tokens", placement: .bottomBar) {
                    FestivalStampsButton(stamps: viewModel.festival.stamps) {
                        showStampsPage = true
                        viewModel.festival.stamps.add()
                    }
                }
            }
        }
        .navigationDestination(isPresented: $showStampsPage) {
            StampsView(festival: viewModel.festival) {
                print("test")
            }
        }
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
