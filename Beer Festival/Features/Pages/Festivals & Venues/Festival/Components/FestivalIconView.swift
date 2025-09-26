//
//  FestivalIconView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 25/09/2025.
//

import SwiftUI

struct FestivalIconView: View {
    
    private let festival: Festival
    
    private let horizontal_padding: CGFloat = 20
    private let vertical_padding: CGFloat = 8
    
    @State var showVenue: Bool
    
    init(festival: Festival) {
        self.festival = festival
        self.showVenue = false
    }
    
    var body: some View {
        
        let bodySize: CGFloat = UIFont.preferredFont(forTextStyle: .body).pointSize
        let captionSize: CGFloat = UIFont.preferredFont(forTextStyle: .caption1).pointSize
        
        Button {
            showVenue = true
        } label: {
            ZStack(alignment: .bottom) {
                FestivalPictureView(id: festival.id)
                    .padding(.top, 16)
                    .zIndex(1)

                Group {
                    if #available(iOS 26.0, *) {
                        VStack {
                            Text(festival.name)
                                .font(.body)
                                .fontWeight(.semibold)
                            Text(festival.venue.name)
                                .font(.caption)
                        }
                        .foregroundStyle(Color(.label))
                        .padding(.horizontal, horizontal_padding)
                        .padding(.vertical, vertical_padding)
                        .glassEffect(.clear)
                    } else {
                        Text(festival.name)
                    }
                }
                .zIndex(0)
                .offset(y: ((vertical_padding * 2) + (bodySize + captionSize)))
            }
            .navigationDestination(isPresented: $showVenue) {
                VenueView(venue: festival.venue)
            }
        }
    }
    
}

#Preview {
    FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
