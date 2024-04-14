//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 11/04/2024.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
