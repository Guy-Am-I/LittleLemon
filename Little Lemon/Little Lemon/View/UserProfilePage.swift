//
//  UserProfilePage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct UserProfilePage: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
            Text(UserDefaults.standard.string(forKey: kFirstName)!)
            Text(UserDefaults.standard.string(forKey: kLastName)!)
            Text(UserDefaults.standard.string(forKey: kEmail)!)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .padding()
            .clipShape(Capsule())
            .background(Color.yellow)
            .cornerRadius(50)
            Spacer()
        }
    }
}

#Preview {
    UserProfilePage()
}
