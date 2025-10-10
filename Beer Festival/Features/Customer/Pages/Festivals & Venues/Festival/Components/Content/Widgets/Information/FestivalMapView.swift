//
//  FestivalMapView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI
import MapKit

struct FestivalMapView: View {
    
    private let coordinates: CLLocationCoordinate2D
    private let location: String
    private let size, cornerRadius: CGFloat
    private let textColor: Color
    
    @State private var position: MapCameraPosition
    
    init(location: String, coordinates: CLLocationCoordinate2D, size: CGFloat, cornerRadius: CGFloat, textColor: Color) {
        self.location = location
        self.coordinates = coordinates
        self.size = size
        self.cornerRadius = cornerRadius
        self.textColor = textColor
        
        _position = State(initialValue: .region(
            MKCoordinateRegion(
                center: coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        ))
    }

    var body: some View {
        VStack(spacing: 8) {
            Map(position: $position)
                .mapStyle(.standard)
                .ignoresSafeArea()
                .frame(height: size)
                .cornerRadius(cornerRadius)
            Text(location)
                .foregroundStyle(textColor)
                .font(.caption.weight(.semibold))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 10)
        }
    }
}
