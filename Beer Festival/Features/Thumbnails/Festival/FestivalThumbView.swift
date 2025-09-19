//
//  VenueThumbView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 15/09/2025.
//

import SwiftUI

struct FestivalThumbView: View, Hashable {
    
    let festival: Festival
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(festival.name)
                .font(.title3.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(festival.venue.address)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                VStack {
                    FestivalPictureView(id: festival.id)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.sage))
        .cornerRadius(10)
        .padding([.top, .leading, .trailing])
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}



