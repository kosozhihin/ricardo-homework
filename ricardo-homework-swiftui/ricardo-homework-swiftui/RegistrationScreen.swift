//
//  ContentView.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct RegistrationScreen: View {
    private static let passwordRequirements = """
            Password must meet the following requirements:
                - At least 8 characters
                - Must contain a letter
                - Must contain a decimal
                - Must contain a special character
            """

    var onRegistrationSuccessful: () -> Void

    @State private var username = ""
    @FocusState private var isUsernameFocused
    @State private var wasUsernameEverModified = false
    @State private var isUsernameValid = false

    @State private var password = ""
    @FocusState private var isPasswordFocused
    @State private var wasPasswordEverModified = false
    @State private var isPasswordValid = false

    var body: some View {
        CenteredScrollView {
            TextFieldWithError(
                title: "Username",
                text: $username,
                errorMessage: (isUsernameValid || !wasUsernameEverModified) ? nil : "Username not valid"
            )
            .focused($isUsernameFocused)
            .onChange(of: username) { username in
                isUsernameValid = !username.isEmpty
            }
            .onChange(of: isUsernameFocused) { isFocused in
                if !isFocused {
                    wasUsernameEverModified = true
                }
            }

            TextFieldWithError(
                title: "Password",
                text: $password,
                errorMessage: (isPasswordValid || !wasPasswordEverModified) ? nil : "Password not valid"
            )
            .focused($isPasswordFocused)
            .onChange(of: password) { password in
                isPasswordValid =
                    password.count >= 6 &&
                    password.rangeOfCharacter(from: .letters) != nil &&
                    password.rangeOfCharacter(from: .decimalDigits) != nil &&
                    password.rangeOfCharacter(from: .alphanumerics.inverted) != nil
            }
            .onChange(of: isPasswordFocused) { isFocused in
                if !isFocused {
                    wasPasswordEverModified = true
                }
            }

            Spacer().frame(height: 20)

            Text(Self.passwordRequirements)
                .font(.system(.callout))
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer().frame(height: 40)

            Button(action: registerButtonTapped) {
                Text("Register")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.orange)
                    .cornerRadius(8)
            }

            Spacer().frame(height: 100)
        }
        .padding()
    }

    private func registerButtonTapped() {
        wasUsernameEverModified = true
        wasPasswordEverModified = true

        isUsernameValid = !username.isEmpty
        isPasswordValid =
            password.count >= 8 &&
            password.rangeOfCharacter(from: .letters) != nil &&
            password.rangeOfCharacter(from: .decimalDigits) != nil &&
            password.rangeOfCharacter(from: .alphanumerics.inverted) != nil

        guard isUsernameValid && isPasswordValid else {
            return
        }

        onRegistrationSuccessful()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen(onRegistrationSuccessful: {
            print("Success")
        })
    }
}
