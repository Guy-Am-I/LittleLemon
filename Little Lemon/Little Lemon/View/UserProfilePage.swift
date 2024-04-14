//
//  UserProfilePage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

let kFirstName = "KeyFirstName"
let kLastName = "KeyLastName"
let kEmail = "KeyEmail"
let kPhoneNumber = "KeyPhoneNumber"

struct UserProfilePage: View {
    @Environment(\.presentationMode) var presentation
    @State var firstNameForm: String = ""
    @State var lastNameForm: String = ""
    @State var emailForm: String = ""
    @State var phoneNumberForm: String = ""
    
    let userFirstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let userLastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let userEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
    let userPhoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    
    var body: some View {
        VStack {
            Header()
            AvatarImageSection()
            Divider()
            InputField(label: "First Name", value: userFirstName,  formField: $firstNameForm)
            InputField(label: "Last Name", value: userLastName, formField: $lastNameForm)
            InputField(label: "Email", value: userEmail, formField: $emailForm)
            InputField(label: "Phone Number", value: userPhoneNumber,  formField: $phoneNumberForm)
            Button {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text(("Logout"))
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .clipShape(Capsule())
            .background(Color.yellow)
            .cornerRadius(50)
            
            Spacer()
        }.padding()
    }
}

struct AvatarImageSection: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Avatar")
                    .font(.caption2)
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 100)
                    .clipShape(Circle())
            }
            Button("Change") {}
                .buttonStyle(.borderedProminent)
                .background()
            Button("Remove") {}
                .buttonStyle(.borderedProminent)
                .background()
            Spacer()
        }
    }
}

struct InputField: View {
    let label: String
    let value: String
    var formField: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.subheadline)
            TextField("", text: formField)
                .font(.system(size: 17, weight: .thin))
                .frame(height: 44)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
        }
    }
}

#Preview {
    UserProfilePage()
}
