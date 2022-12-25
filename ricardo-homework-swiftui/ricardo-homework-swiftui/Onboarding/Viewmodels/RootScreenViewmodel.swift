//
//  RootScreenViewmodel.swift
//  ricardo-homework-swiftui
//
//  Created by Aleksei Kosozhikhin on 25.12.22.
//

import Foundation

class RootScreenViewmodel : ObservableObject {
    @Published var registrationViewmodel = RegistrationScreenViewmodel(
        onRegistrationSuccessful: {})
    @Published var isSuccessScreenShown = false

    init () {
        registrationViewmodel = RegistrationScreenViewmodel(
            onRegistrationSuccessful: onRegistrationSuccessful)
    }
    
    private func onRegistrationSuccessful() {
        self.isSuccessScreenShown = true
    }
}
