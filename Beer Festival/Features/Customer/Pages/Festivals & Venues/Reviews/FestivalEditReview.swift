//
//  FestivalEditReview.swift
//  Beer Festival
//
//  Created by Karl Cridland on 08/10/2025.
//

import SwiftUI

struct FestivalEditReview: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let festival: Festival
    @State private var review: FestivalReview
    @State var rating: Int = 0
    
    init(festival: Festival, review: FestivalReview = FestivalReview(date: Date(), name: "", message: "", rating: 0)) {
        self.festival = festival
        self.review = review
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                DrinkRaterView(color: festival.venue.colorScheme.primaryText, rating: $rating, onUpdate: {
                    review.update(rating)
                })
                ZStack(alignment: .topLeading) {
                    if review.message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Text("Write your review…")
                            .font(.body.weight(.medium))
                            .foregroundStyle(festival.venue.colorScheme.primaryText.opacity(0.5))
                            .padding(.top, 20)
                            .padding(.leading, 16)
                    }
                    TextEditor(text: $review.message)
                        .font(.body.weight(.medium))
                        .scrollContentBackground(.hidden)
                        .background(.clear)
                        .frame(minHeight: 120, maxHeight: 200)
                        .padding(12)
                        .foregroundStyle(festival.venue.colorScheme.primaryText)
                }
                .background(festival.venue.colorScheme.primaryText.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                Spacer()
            }
            .padding(20)
            .edgesIgnoringSafeArea(.bottom)
            .background(festival.venue.colorScheme.primary)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", action: { dismiss() })
                    .padding(.horizontal)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        // TODO: Save review
                    }
                    .padding(.horizontal)
                }
            }
            
        }
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: FestivalExamples.adnams).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .toolbarTitleDisplayMode(.inline)
            
        }
    }
}
