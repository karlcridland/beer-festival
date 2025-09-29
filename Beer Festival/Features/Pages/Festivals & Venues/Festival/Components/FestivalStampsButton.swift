//
//  FestivalStampsButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 26/09/2025.
//

import SwiftUI

struct FestivalStampsButton: View {
    
    @ObservedObject var stamps: Stamps
    var onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack {
                Image(systemName: "ticket")
                if stamps.remaining > 0 {
                    Text(String(stamps.remaining))
                        .bold()
                }
                else {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
}
