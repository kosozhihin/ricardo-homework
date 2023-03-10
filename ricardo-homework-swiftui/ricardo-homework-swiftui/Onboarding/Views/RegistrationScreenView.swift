//
//  RegistrationScreenView.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct RegistrationScreenView: View {
    @ObservedObject var viewmodel: RegistrationScreenViewmodel

    var body: some View {
        CenteredScrollView {
            TextFieldWithErrorView(
                viewmodel: viewmodel.usernameViewmodel!
            )
            .accessibilityIdentifier("usernameTextField")

            TextFieldWithErrorView(
                viewmodel: viewmodel.passwordViewmodel!
            )
            .accessibilityIdentifier("passwordTextField")

            Spacer().frame(height: 20)

            Text("Registration.PasswordRequirementsLabel.Text")
                .font(.system(.callout))
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer().frame(height: 40)

            Button(action: viewmodel.registerButtonTapped) {
                Text("Registration.RegisterButton.Text")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .accessibilityIdentifier("registrationButton")

            Spacer().frame(height: 100)
        }
        .padding()
    }
}

struct RegistrationScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreenView(viewmodel: RegistrationScreenViewmodel(onRegistrationSuccessful: {
                print("Success")
            })
        )
    }
}
