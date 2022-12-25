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
    
    private let fieldValidator = FieldValidator()
    
    init(onRegistrationSuccessful: @escaping () -> Void) {
        usernameViewmodel = TextFieldWithErrorViewmodel(
            title: "Username", validationRule: fieldValidator.validateUsername)
        passwordViewmodel = TextFieldWithErrorViewmodel(
            title: "Password", validationRule: fieldValidator.validatePassword)
        
        self.onRegistrationSuccessful = onRegistrationSuccessful
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
