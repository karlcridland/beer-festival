//
//  ContentView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)], animation: .default)
    
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundYellow)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    if #available(iOS 26.0, *) {
                        NavigationView()
                    } else {
                        // Fallback on earlier versions
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
