//
//  RootScreen.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct RootScreen: View {
    @State private var isSuccessScreenShown = false

    var body: some View {
        RegistrationScreen(onRegistrationSuccessful: {
            isSuccessScreenShown = true
        })
        .alert(
            "Registration successful",
            isPresented: $isSuccessScreenShown,
            actions: {
                Button("Ok", role: .cancel) {}
            })
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
    }
}
