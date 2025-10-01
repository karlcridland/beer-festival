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
        VStack(alignment: .leading) {
            Text(festival.name)
                .font(.title3.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                VStack(alignment: .center) {
                    FestivalPictureView(id: festival.id)
                    
                    Text("\(festival.venue.city)\n\(festival.dates.toDates)")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                VStack {
                }
            }
        }
        .foregroundStyle(Color(.label))
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color(.thumbnailGrey))
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 0)
        .padding([.leading, .trailing], 12)
        .padding([.top, .bottom], 3)
        .navigationDestination(isPresented: $showFestivalPage) {
            FestivalView(festival: festival)
        }
        .onTapGesture {
            showFestivalPage = true
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
