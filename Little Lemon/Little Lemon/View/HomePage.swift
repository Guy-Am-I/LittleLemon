//
//  HomePage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct HomePage: View {
    let persistence = PersistenceController.shared
    @State var goToProfile = false
    
    var body: some View {
        NavigationView {
            VStack {
                MenuPage()
                    .environment(\.managedObjectContext, persistence.container.viewContext)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: UserProfilePage(), isActive: $goToProfile) {
                        Button {
                            self.goToProfile = true
                        } label: {
                        Image("profile")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .clipShape(Circle())
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomePage()
}
