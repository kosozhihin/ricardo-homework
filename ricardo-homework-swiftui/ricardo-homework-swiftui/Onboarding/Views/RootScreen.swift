//
//  RootScreenView.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct RootScreenView: View {
    @StateObject private var viewmodel = RootScreenViewmodel()

    var body: some View {
        RegistrationScreenView(viewmodel: viewmodel.registrationViewmodel)
        .alert(
            "Registration successful",
            isPresented: $viewmodel.isSuccessScreenShown,
            actions: {
                Button("Ok", role: .cancel) {}
            })
    }
}

struct RootScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RootScreenView()
    }
}
