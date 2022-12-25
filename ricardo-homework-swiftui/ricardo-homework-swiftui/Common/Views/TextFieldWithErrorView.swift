//
//  TextFieldWithError.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct TextFieldWithErrorView: View {
    @ObservedObject var viewmodel: TextFieldWithErrorViewmodel
    @FocusState private var isFocused

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            TextField(viewmodel.title, text: $viewmodel.text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .focused($isFocused)
                .onChange(of: isFocused) { isFocused in
                    if !isFocused {
                        viewmodel.wasEverModified = true
                    }
                }

            // Maintain a fixed height even when no error is shown,
            // to prevent content jumping up and down
            Text(viewmodel.errorMessage ?? " ")
                .font(.system(.callout))
                .foregroundColor(.red)
        }
    }
}

struct TextFieldWithErrorView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithErrorView(
            viewmodel: TextFieldWithErrorViewmodel(
                title: "Username",
                text: "",
                errorMessage: "Username not valid")
            )
    }
}
