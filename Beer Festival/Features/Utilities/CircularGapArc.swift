//
//  CircularGapArc.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/10/2025.
//

import SwiftUI

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
