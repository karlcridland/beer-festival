//
//  NavButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 16/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct NavButton: View {
    
    let systemName: String
    let height: CGFloat
    let namespace: Namespace.ID
    let action: () -> Void
    
    init(_ systemName: String, _ height: CGFloat, _ namespace: Namespace.ID, action: @escaping () -> Void) {
        self.systemName = systemName
        self.height = height
        self.namespace = namespace
        self.action = action
    }
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Image(systemName: systemName)
                .foregroundStyle(Color(.label))
                .frame(width: height, height: height)
                .font(.system(size: (height * 2) / 5, weight: .medium))
                .glassEffect()
                .glassEffectID("eraser", in: namespace)
        }
    }
}
