//
//  FestivalInformationWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI
import MapKit

struct FestivalInformationWidgetView: View {
    
    var festival: Festival
    
    private let height: CGFloat = 100
    private let padding: CGFloat = 12
    private let cornerRadius: CGFloat = 24
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var body: some View {
        FestivalWidgetView {
            HStack(spacing: 12) {
                FestivalMapView(location: self.festival.venue.toString, coordinates: CLLocationCoordinate2D(), size: height + (2 * padding), cornerRadius: cornerRadius)
                
                VStack(alignment: .center, spacing: 8) {
                    QRCodeView(value: "testing 123", size: height, tint: .white)
                        .padding(padding)
                        .background((festival.venue.colorScheme?.accent ?? .black).opacity(0.8))
                        .cornerRadius(cornerRadius)
                        .disabled(festival.tokens.remaining == 0)
                    
                    Text("Scan to redeem your tokens")
                        .frame(maxWidth: height + (2 * padding))
                        .font(.caption.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
    
}
