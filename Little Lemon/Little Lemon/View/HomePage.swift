//
//  HomePage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct HomePage: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        VStack {
            Header()
            MenuPage()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomePage()
}
