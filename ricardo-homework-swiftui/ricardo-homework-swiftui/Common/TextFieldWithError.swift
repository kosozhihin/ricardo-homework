//
//  TextFieldWithError.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct TextFieldWithError: View {
    var title: String
    @Binding var text: String
    var errorMessage: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            TextField(title, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)

            // Maintain a fixed height even when no error is shown,
            // to prevent content jumping up and down
            Text(errorMessage ?? " ")
                .font(.system(.callout))
                .foregroundColor(.red)
        }
    }
}

struct TextFieldWithError_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithError(
            title: "Username",
            text: .constant(""),
            errorMessage: "Username not valid")
    }
}
