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
    private let location, venueName: String
    private let size, cornerRadius: CGFloat
    private let tint, textColor: Color
    
    @State private var position: MapCameraPosition
    
    init(location: String, venueName: String, coordinates: CLLocationCoordinate2D, size: CGFloat, cornerRadius: CGFloat, tint: Color, textColor: Color) {
        self.location = location
        self.venueName = venueName
        self.coordinates = coordinates
        self.size = size
        self.cornerRadius = cornerRadius
        self.tint = tint
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
            Button {
                openExternalMap()
            } label: {
                Map(position: $position) {
                        Marker(venueName, coordinate: coordinates)
                }
                .tint(tint)
                .mapStyle(.standard)
                .disabled(true)
                .ignoresSafeArea()
                .frame(height: size)
                .cornerRadius(cornerRadius)
            }
            .buttonStyle(.borderless)
            Text(location)
                .foregroundStyle(textColor)
                .font(.caption.weight(.semibold))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 10)
        }
    }
    
    func openExternalMap() {
        let address: String = [venueName, location].joined(separator: " ")
        if let encoded = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "http://maps.apple.com/?address=\(encoded)") {
            UIApplication.shared.open(url)
        }
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: FestivalExamples.primary).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .toolbarTitleDisplayMode(.inline)
        }
    }
}
