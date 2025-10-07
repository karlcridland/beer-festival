//
//  FestivalReviewsWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct FestivalReviewsWidgetView: View {
    
    var festival: Festival
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var body: some View {
        FestivalWidgetView(title: "Reviews", content: {
            AnyView(
                VStack(alignment: .center) {
                    Text("No reviews yet. Be the first!")
                        .font(.body.weight(.semibold))
                        .padding()
                }
                .frame(maxWidth: .infinity)
            )
        }, button: {
            AnyView(
                Button{
                } label: {
                    Label("review", systemImage: "plus")
                        .font(Font.body.weight(.semibold))
                }
            )
        })
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

