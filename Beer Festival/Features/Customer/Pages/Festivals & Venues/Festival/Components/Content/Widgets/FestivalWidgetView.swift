//
//  FestivalWidgetView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 05/10/2025.
//

import SwiftUI

struct FestivalWidgetView<Content: View>: View {

    private let title: String?
    private let textColor: Color
    private let subview: Content
    private let button: Content?
    
    init(title: String? = nil, textColor: Color, @ViewBuilder content: () -> Content, @ViewBuilder button: () -> Content) {
        self.title = title
        self.textColor = textColor
        self.subview = content()
        self.button = button()
    }
    
    init(title: String? = nil, textColor: Color, @ViewBuilder content: () -> Content) {
        self.title = title
        self.textColor = textColor
        self.subview = content()
        self.button = nil
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let title = title {
                HStack(alignment: .center) {
                    Text(title)
                        .font(.title2.bold())
                        .foregroundStyle(textColor)
                    Spacer()
                    if let button = button {
                        button
                    }
                }
                .padding(.bottom, 12)
            }
            subview
        }
        .foregroundStyle(Color(.white))
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing, .top])
    }
    
}
