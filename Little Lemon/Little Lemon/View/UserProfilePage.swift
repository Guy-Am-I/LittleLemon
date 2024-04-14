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
    @State var test = false
    
    let userFirstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let userLastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let userEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
    let userPhoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    
    var body: some View {
        VStack {
            AvatarImageSection()
            Divider()
            InputField(label: "First Name", value: userFirstName,  formField: $firstNameForm)
            InputField(label: "Last Name", value: userLastName, formField: $lastNameForm)
            InputField(label: "Email", value: userEmail, formField: $emailForm)
            InputField(label: "Phone Number", value: userPhoneNumber,  formField: $phoneNumberForm)
            NotificationsForm()
            Button {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text(("Logout"))
                    .frame(maxWidth: .infinity)
            }
            .padding(10)
            .clipShape(Capsule())
            .background(Color.yellow)
            .cornerRadius(10)
            HStack {
                Button("Discard Changes") {}
                    .buttonStyle(.bordered)
                    .background()
                Button("Save Changes") {}
                    .buttonStyle(.borderedProminent)
                    .background()
            }.padding()
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
                    .frame(height: 50)
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
                .font(.footnote)
            TextField("", text: formField)
                .font(.system(size: 17, weight: .thin))
                .frame(height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
        }.padding(.bottom)
    }
}

struct NotifOption: Identifiable {
    let id: String
    var isFollowing: Bool = false
}

struct NotificationsForm: View {
    @State var notifications = [
        NotifOption(id: "Order Statuses"),
        NotifOption(id: "Password Changes"),
        NotifOption(id: "Special Offers"),
        NotifOption(id: "Newsletter")]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email notifications")
                .font(.subheadline)
                .foregroundColor(.primaryColorGreen)
            VStack {
                ForEach($notifications) { $notif in
                    Toggle(notif.id, isOn: $notif.isFollowing)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                .font(.caption)
                .foregroundColor(.primaryColorGreen)
            }
        }
    }
}

#Preview {
    UserProfilePage()
}
