//
//  FieldValidator.swift
//  ricardo-homework-swiftui
//
//  Created by Aleksei Kosozhikhin on 25.12.22.
//

import Foundation

class FieldValidator {
    func validateUsername(username: String) -> String? {
        return !username.isEmpty ? nil : String(localized: "Registration.UsernameErrorLabel.Text")
    }
    
    func validatePassword(password: String) -> String? {
        return password.count >= 6 &&
               password.rangeOfCharacter(from: .letters) != nil &&
               password.rangeOfCharacter(from: .decimalDigits) != nil &&
               password.rangeOfCharacter(from: .alphanumerics.inverted) != nil
            ? nil : String(localized: "Registration.PasswordErrorLabel.Text")
    }
}
