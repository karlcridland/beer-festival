//
//  FestivalWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct FestivalWidgetView<Content: View>: View {

    private let title: String?
    private let subview: Content

    init(title: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.subview = content()
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let title = title {
                Text(title)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 12)
            }
            subview
        }
        .foregroundStyle(Color(.white))
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing, .top])
    }
    
}
