//
//  ToolbarButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 25/09/2025.
//

import SwiftUI

struct ToolbarButton: View {
    
    let label, systemImage: String
    var shouldAppear: Bool
    var onClick: () -> Void
    
    init(label: String, systemImage: String, shouldAppear: Bool = true, onClick: @escaping () -> Void) {
        self.label = label
        self.systemImage = systemImage
        self.shouldAppear = shouldAppear
        self.onClick = onClick
    }
    
    var body: some View {
        if shouldAppear {
            Button(label, systemImage: systemImage) {
                withAnimation {
                    onClick()
                }
            }
            .foregroundStyle(Color(.label))
            .tint(Color(.label))
        }
    }
    
}
