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
    
    @State var fullScreen: Bool = false
    
    init(festival: Festival) {
        self.festival = festival
    }
    
    var body: some View {
        FestivalWidgetView {
            HStack(spacing: 12) {
                FestivalMapView(location: self.festival.venue.toString, coordinates: festival.coordinate, size: height + (2 * padding), cornerRadius: cornerRadius)
                
                VStack(alignment: .center, spacing: 8) {
                    Button {
                        fullScreen = true
                    } label: {
                        QRCodeView(value: qr_code, size: height, tint: .white)
                            .padding(padding)
                            .background(festival.venue.colorScheme.buttonAccent)
                            .cornerRadius(cornerRadius)
                            .disabled(festival.tokens.remaining == 0)
                    }
                    .buttonStyle(.borderless)
                    
                    Text("Scan to redeem your tokens")
                        .frame(maxWidth: height + (2 * padding))
                        .font(.caption.weight(.semibold))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .popover(isPresented: $fullScreen) {
            FestivalUserQRCodeView(value: qr_code, colorScheme: festival.venue.colorScheme)
        }
    }
    
    var qr_code: String {
        return "testing 123"
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

