//
//  CircularProgressGapView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/10/2025.
//

import SwiftUI

struct CircularProgressGapView<Content: View>: View {
    
    var progress: Double
    var gapDegrees: Double
    var lineWidth: CGFloat
    
    var progressColor: Color = .accentColor
    var iconColor: Color
    
    private let bottomContent: Content?
    private let centerContent: Content?
    
    init(progress: Double, gapDegrees: Double = 90, lineWidth: CGFloat = 8, progressColor: Color = .accentColor, iconColor: Color, @ViewBuilder bottomContent: () -> Content, @ViewBuilder centerContent: () -> Content) {
        self.progress = progress
        self.gapDegrees = gapDegrees
        self.lineWidth = lineWidth
        
        self.progressColor = progressColor
        self.iconColor = iconColor
        
        self.bottomContent = bottomContent()
        self.centerContent = centerContent()
    }
    
    init(progress: Double, gapDegrees: Double = 90, lineWidth: CGFloat = 8, progressColor: Color = .accentColor, iconColor: Color, @ViewBuilder bottomContent: () -> Content) {
        self.progress = progress
        self.gapDegrees = gapDegrees
        self.lineWidth = lineWidth
        
        self.progressColor = progressColor
        self.iconColor = iconColor
        
        self.bottomContent = bottomContent()
        self.centerContent = nil
    }
    
    init(progress: Double, gapDegrees: Double = 90, lineWidth: CGFloat = 8, progressColor: Color = .accentColor, iconColor: Color, @ViewBuilder centerContent: () -> Content) {
        self.progress = progress
        self.gapDegrees = gapDegrees
        self.lineWidth = lineWidth
        
        self.progressColor = progressColor
        self.iconColor = iconColor
        
        self.bottomContent = nil
        self.centerContent = centerContent()
    }

    var body: some View {
        ZStack {
            CircularGapArc(progress: 1, gapDegrees: gapDegrees)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundStyle(progressColor.opacity(0.4))
            CircularGapArc(progress: progress, gapDegrees: gapDegrees)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundStyle(progressColor)
                .animation(.easeInOut(duration: 0.4), value: progress)
        }
        .aspectRatio(1, contentMode: .fit)
        .overlay(alignment: .center) {
            centerContent
        }
        .overlay(alignment: .bottom) {
            bottomContent
        }
    }
}
