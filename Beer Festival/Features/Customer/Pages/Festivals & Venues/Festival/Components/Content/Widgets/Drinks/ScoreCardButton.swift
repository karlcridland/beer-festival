//
//  ScoreCardButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 06/10/2025.
//

import SwiftUI

struct ScoreCardButton: View {
    
    let drinkCount: Int
    let tint: Color?
    let background: Color
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                let color = tint ?? Color(.label)
                CircularProgressGapView(progress: 0.5, trackColor: color.opacity(0.2), progressColor: color)
                    .frame(width: 80, height: 80)
            }
            .buttonStyle(.borderless)
            Text("Score Card")
                .font(.caption.weight(.semibold))
        }
    }
}

struct CircularGapArc: Shape {
    
    var progress: Double
    var gapDegrees: Double = 80

    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let startDeg = 90 + gapDegrees / 2
        let sweep = 360 - gapDegrees
        let clamped = max(0, min(1, progress))
        let endDeg = startDeg + sweep * clamped

        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(startDeg),
            endAngle: .degrees(endDeg),
            clockwise: false
        )
        return path
    }
}

struct CircularProgressGapView<GapContent: View>: View {
    
    var progress: Double
    var gapDegrees: Double
    var lineWidth: CGFloat
    var trackColor: Color = .gray.opacity(0.25)
    var progressColor: Color = .accentColor
    @ViewBuilder var gapContent: () -> GapContent

    init(
        progress: Double,
        gapDegrees: Double = 90,
        lineWidth: CGFloat = 8,
        trackColor: Color = .accentColor.opacity(0.2),
        progressColor: Color = .accentColor,
        @ViewBuilder gapContent: @escaping () -> GapContent = { EmptyView() }
    ) {
        self.progress = progress
        self.gapDegrees = gapDegrees
        self.lineWidth = lineWidth
        self.trackColor = trackColor
        self.progressColor = progressColor
        self.gapContent = gapContent
    }

    var body: some View {
        ZStack {
            CircularGapArc(progress: 1, gapDegrees: gapDegrees)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundStyle(trackColor)
            CircularGapArc(progress: progress, gapDegrees: gapDegrees)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundStyle(progressColor)
                .animation(.easeInOut(duration: 0.4), value: progress)
        }
        .aspectRatio(1, contentMode: .fit)
        .overlay(alignment: .center) {
            Image(systemName: "circle.grid.2x2.topleft.checkmark.filled")
                .font(.title.weight(.semibold))
        }
    }
}
