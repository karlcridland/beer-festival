//
//  FestivalReviewsWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct FestivalReviewsWidgetView: View {
    
    var festival: Festival
    
    @State private var showNewReview: Bool = false
    
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
                    showNewReview = true
                } label: {
                    HStack {
                        Text("review")
                        Image(systemName: "plus")
                    }
                    .font(.body.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .padding(.leading, 5)
                    .background(festival.venue.colorScheme.buttonAccent)
                    .cornerRadius(50)
                }
                .buttonStyle(.borderless)
            )
        })
        .popover(isPresented: $showNewReview) {
            FestivalEditReview()
        }
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .toolbarTitleDisplayMode(.inline)
        }
    }
}

