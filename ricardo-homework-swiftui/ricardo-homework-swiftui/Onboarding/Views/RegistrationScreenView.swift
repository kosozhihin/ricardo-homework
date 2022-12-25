//
//  RegistrationScreenView.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct RegistrationScreenView: View {
    @ObservedObject var viewmodel: RegistrationScreenViewmodel
    
    private static let passwordRequirements = """
            Password must meet the following requirements:
                - At least 8 characters
                - Must contain a letter
                - Must contain a decimal
                - Must contain a special character
            """

    var body: some View {
        CenteredScrollView {
            TextFieldWithErrorView(
                viewmodel: viewmodel.usernameViewmodel!
            )

            TextFieldWithErrorView(
                viewmodel: viewmodel.passwordViewmodel!
            )

            Spacer().frame(height: 20)

            Text(Self.passwordRequirements)
                .font(.system(.callout))
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer().frame(height: 40)

            Button(action: viewmodel.registerButtonTapped) {
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
}

struct RegistrationScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreenView(viewmodel: RegistrationScreenViewmodel(onRegistrationSuccessful: {
                print("Success")
            })
        )
    }
}
