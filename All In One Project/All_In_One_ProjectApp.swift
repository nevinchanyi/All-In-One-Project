//
//  All_In_One_ProjectApp.swift
//  All In One Project
//
//  Created by constantine kos on 11.01.2021.
//

import SwiftUI

@main
struct All_In_One_ProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
