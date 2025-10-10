//
//  FestivalTokensButton.swift
//  Beer Festival
//
//  Created by Karl Cridland on 26/09/2025.
//

import SwiftUI

struct FestivalTokensButton: View {
    
    @ObservedObject var tokens: Tokens
    let textColor: Color
    let onClick: () -> Void
    
    var body: some View {
        let tokenCount: Int = tokens.remaining
        HStack {
            Button {
                onClick()
            } label: {
                Image(systemName: "ticket")
                    .foregroundStyle(textColor)
                Text(tokenCount > 0 ? "\(tokenCount) token\(tokenCount  == 1 ? "" : "s")" : "add tokens")
                    .foregroundStyle(textColor)
                Spacer()
            }
            Button("Scan Code", systemImage: "barcode.viewfinder") {
                print("bing bong")
            }
            .foregroundStyle(textColor)
            .opacity(tokenCount == 0 ? 0.3 : 1.0)
            .disabled(tokenCount == 0)
        }
        .font(.body.bold())
        .padding(.horizontal, 10)
    }
    
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            FestivalView(festival: FestivalExamples.primary).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .toolbarTitleDisplayMode(.inline)
        }
    }
}
