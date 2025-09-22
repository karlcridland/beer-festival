//
//  FestivalView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct FestivalView: View {
    
    @ObservedObject var viewModel: FestivalViewModel
    
    init(festival: Festival) {
        _viewModel = ObservedObject(wrappedValue: FestivalViewModel(festival: festival))
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.backgroundYellow)
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .ignoresSafeArea(.keyboard, edges: .top)
            .background(.backgroundYellow)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    FestivalHeaderView(festival: viewModel.festival)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // TODO: Handle action for the nav bar button
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
    }
    
}

struct FestivalHeaderView: View {
    
    let festival: Festival
    let horizontal_padding: CGFloat = 12
    let vertical_padding: CGFloat = 8
    
    var body: some View {
        let pointSize: CGFloat = UIFont.preferredFont(forTextStyle: .body).pointSize
        ZStack(alignment: .bottom) {
            FestivalPictureView(id: festival.id)
                .padding(.top, 16)
                .zIndex(1)

            Group {
                if #available(iOS 26.0, *) {
                    Text(festival.name)
                        .padding(.horizontal, horizontal_padding)
                        .padding(.vertical, vertical_padding)
                        .glassEffect(.clear)
                } else {
                    Text(festival.name)
                }
            }
            .zIndex(0)
            .offset(y: (vertical_padding * 2) + pointSize)
        }
    }
    
}

#Preview {
    FestivalView(festival: Festival.example).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
