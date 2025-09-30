//
//  Beer_FestivalApp.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/07/2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Beer_FestivalApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            if #available(iOS 26.0, *) {
                HomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                HomeViewOld()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
