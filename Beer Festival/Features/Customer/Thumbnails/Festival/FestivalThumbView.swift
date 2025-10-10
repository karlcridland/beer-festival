//
//  VenueThumbView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import SwiftUI

struct FestivalThumbView: View, Hashable {
    
    let festival: Festival
    @State var showFestivalPage: Bool = false
    
    var body: some View {
        let isAttending: Bool = festival.attendance == .attending
        Button {
            showFestivalPage = true
        } label: {
            VStack(spacing: 12) {
                HStack {
                    Text(festival.name)
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Image(systemName: isAttending ? "checkmark.circle.fill" : "arrow.right.circle.fill")
                        .font(.title3.bold())
                        .foregroundStyle(isAttending ? .accent : Color(.systemGray))
                }
                
                HStack(spacing: 8) {
                    FestivalPictureView(id: festival.id, cornerRadius: 18, ratio: 1.4)
                        .shadow(color: Color(.label).opacity(0.25), radius: 8)
                    Spacer()
                    FestivalThumbnailInfoView(value: "1km", label: festival.venue.city, cornerRadius: 24)
                    FestivalThumbnailInfoView(value: festival.dates.timeUntil ?? "N/A", label: festival.dates.description, cornerRadius: 24)
                }
            }
        }
        .foregroundStyle(Color(.label))
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color(.thumbnailGrey))
        .cornerRadius(36)
        .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 0)
        .padding([.leading, .trailing], 12)
        .padding([.top, .bottom], 3)
        .navigationDestination(isPresented: $showFestivalPage) {
            if #available(iOS 26.0, *) {
                FestivalView(festival: festival)
            } else {
                FestivalViewOld(festival: festival)
            }
        }
    }
    
    static func == (lhs: FestivalThumbView, rhs: FestivalThumbView) -> Bool {
        lhs.festival.id == rhs.festival.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(festival.id)
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
