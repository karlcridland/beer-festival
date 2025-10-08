//
//  FestivalUserQRCodeView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 08/10/2025.
//

import SwiftUI

struct FestivalUserQRCodeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    private let value: String
    
    init(value: String, colorScheme: VenueColorScheme ) {
        self.value = value
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                QRCodeView(value: value)
                    .padding()
                Spacer()
            }
            .navigationTitle("Scan me")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
