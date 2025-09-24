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
    
    @State var search: String = ""
    @State private var menuSelection: BFMenu = .Home
    
    enum BFMenu: String, CaseIterable {
        case Home
        case Tokens
        case Profile
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.backgroundYellow)
                    .ignoresSafeArea()
                
                HomeFeedView()
                NavigationView(search: $search)
            }
            
        }
    }
    
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
