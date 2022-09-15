//
//  TicketsApp.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 08/09/22.
//

import SwiftUI

@main
struct TicketsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
