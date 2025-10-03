//
//  FestivalStampsButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 26/09/2025.
//

import SwiftUI

struct FestivalStampsButton: View {
    
    @ObservedObject var stamps: Stamps
    let onClick: () -> Void
    
    var body: some View {
        let stampCount: Int = stamps.remaining
        HStack {
            Button {
                onClick()
            } label: {
                Image(systemName: "ticket")
                Text(stampCount > 0 ? "\(stampCount) stamp\(stampCount  == 1 ? "" : "s")" : "add stamps")
                Spacer()
            }
            Button("Scan Code", systemImage: "barcode.viewfinder") {
                print("bing bong")
            }
            .opacity(stampCount == 0 ? 0.3 : 1.0)
            .disabled(stampCount == 0)
        }
        .font(.body.bold())
        .padding(.horizontal, 10)
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
