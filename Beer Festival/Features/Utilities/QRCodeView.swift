//
//  QRCodeView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    
    let value: String
    let size: CGFloat
    let tint: Color?

    private let context = CIContext()
    private let qrFilter = CIFilter.qrCodeGenerator()
    private let colorFilter = CIFilter.falseColor()

    var body: some View {
        if let image = generateQRCode(from: value) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
        } else {
            Image(systemName: "xmark.circle")
                .symbolRenderingMode(.multicolor)
                .foregroundStyle(.red)
        }
    }

    private func generateQRCode(from string: String) -> UIImage? {
            qrFilter.message = Data(string.utf8)
            guard let qrOutput = qrFilter.outputImage else { return nil }
            
            let scaled = qrOutput.transformed(by: CGAffineTransform(scaleX: 10, y: 10))
            
            colorFilter.inputImage = scaled
            colorFilter.color0 = CIColor(color: UIColor(tint ?? .black))
            colorFilter.color1 = .clear
            
            guard let colored = colorFilter.outputImage else { return nil }
            
            if let cgImage = context.createCGImage(colored, from: colored.extent) {
                return UIImage(cgImage: cgImage)
            }
            return nil
        }
    
}
