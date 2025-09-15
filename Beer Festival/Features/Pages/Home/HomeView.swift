//
//  ContentView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)], animation: .default)
    
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Drink Responsibly")
                    .font(.headline)
                    .foregroundStyle(.chocolate)
                    .padding()
                    .background(.backgroundYellow.opacity(0.6))
                    .padding(2)
                    .cornerRadius(16)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.backgroundYellow))
        }
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
