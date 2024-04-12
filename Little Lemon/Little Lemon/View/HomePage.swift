//
//  HomePage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        TabView {
            MenuPage()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfilePage()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomePage()
}
