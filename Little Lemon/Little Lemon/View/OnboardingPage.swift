//
//  RegistrationPage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

let kFirstName = "KeyFirstName"
let kLastName = "KeyLastName"
let kEmail = "KeyEmail"

struct OnboardingPage: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var invalidInputAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Email ", text: $email)
            Button(action: verifyDetails, label: {
                Text("Register")
            })
            .alert("Invalid Input", isPresented: $invalidInputAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    func verifyDetails() -> Void {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || !isValidEmail(email) {
            invalidInputAlert = true
        } else {
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
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
