//
//  FestivalContentView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 03/10/2025.
//

import SwiftUI

struct FestivalContentView: View {
    
    @ObservedObject var viewModel: FestivalContentViewModel
    
    init(festival: Festival) {
        _viewModel = ObservedObject(initialValue: FestivalContentViewModel(festival: festival))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                FestivalInformationWidgetView(festival: viewModel.festival)
                FestivalDrinksWidgetView(festival: viewModel.festival)
                FestivalGalleryWidgetView(festival: viewModel.festival)
                FestivalReviewsWidgetView(festival: viewModel.festival)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}


#Preview {
    let showHome: Bool = !true
    if #available(iOS 26.0, *) {
        if (showHome) {
            HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        else {
            FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
