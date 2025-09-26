//
//  FestivalStampsButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 26/09/2025.
//

import SwiftUI

struct FestivalStampsButton: View {
    
    var onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack {
                Image(systemName: "ticket")
                Image(systemName: "plus")
            }
        }
    }
    
}
