//
//  RegistrationScreenViewmodel.swift
//  ricardo-homework-swiftui
//
//  Created by Aleksei Kosozhikhin on 24.12.22.
//

import Foundation

class RegistrationScreenViewmodel : ObservableObject {    
    @Published var usernameViewmodel: TextFieldWithErrorViewmodel? = nil
    @Published var passwordViewmodel: TextFieldWithErrorViewmodel? = nil
    
    private var onRegistrationSuccessful: () -> Void = {}
    
    init(onRegistrationSuccessful: @escaping () -> Void) {
        usernameViewmodel = TextFieldWithErrorViewmodel(
            title: "Username", validationRule: validateUsername)
        passwordViewmodel = TextFieldWithErrorViewmodel(
            title: "Password", validationRule: validatePassword)
        
        self.onRegistrationSuccessful = onRegistrationSuccessful
    }
    
    private func validateUsername(username: String) -> String? {
        return !username.isEmpty ? nil : "Username not valid"
    }
    
    private func validatePassword(password: String) -> String? {
        return password.count >= 6 &&
               password.rangeOfCharacter(from: .letters) != nil &&
               password.rangeOfCharacter(from: .decimalDigits) != nil &&
               password.rangeOfCharacter(from: .alphanumerics.inverted) != nil
            ? nil : "Password not valid"
    }

    public func registerButtonTapped() {
        usernameViewmodel?.wasEverModified = true
        passwordViewmodel?.wasEverModified = true

        guard usernameViewmodel?.isValid == true &&
              passwordViewmodel?.isValid == true else {
            return
        }

        onRegistrationSuccessful()
    }
}
