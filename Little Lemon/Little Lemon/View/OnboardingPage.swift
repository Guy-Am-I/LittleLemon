//
//  RegistrationPage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

let kIsLoggedIn = "KeyIsLoggedIn"

struct OnboardingPage: View {
    @State var isLoggedIn = false
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var invalidInputAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: HomePage(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Header()
                RestaurantInfo()
                Text("Please Sign Up below")
                    .font(.subheadline)
                    .padding(.top, 30)
                TextField("First Name", text: $firstName)
                    .font(.system(size: 17, weight: .thin))
                    .frame(height: 44)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(4.0)
                TextField("Last Name", text: $lastName)
                    .font(.system(size: 17, weight: .thin))
                    .frame(height: 44)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(4.0)
                TextField("Email ", text: $email)
                    .font(.system(size: 17, weight: .thin))
                    .frame(height: 44)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(4.0)
                Button(action: verifyDetails, label: {
                    Text("Register")
                })
                .alert("Invalid Input", isPresented: $invalidInputAlert) {
                    Button("OK", role: .cancel) { }
                }
                .padding()
                .padding([.leading, .trailing], 50)
                .background(.yellow)
                .cornerRadius(100)
                Spacer()
            }
            .onAppear() {
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
            }
        }
    }
    
    func verifyDetails() -> Void {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || !isValidEmail(email) {
            invalidInputAlert = true
        } else {
            isLoggedIn = true
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

#Preview {
    OnboardingPage()
}
