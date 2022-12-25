//
//  TextFieldWithErrorViewmodel.swift
//  ricardo-homework-swiftui
//
//  Created by Aleksei Kosozhikhin on 24.12.22.
//

import Foundation

class TextFieldWithErrorViewmodel : ObservableObject {
    
    init(title: String, validationRule: ((String) -> String?)? = nil) {
        self.title = title
        self.validationRule = validationRule
        if (validationRule == nil) {
            self.isValid = true
        }
    }
    
    convenience init(title: String, text: String, errorMessage: String?) {
        self.init(title: title)
        self.text = text
        self.errorMessage = errorMessage
    }
    
    public private(set) var title: String = ""
    @Published var text: String = "" {
        didSet {
            validateText()
        }
    }
    private var validationRule: ((String) -> String?)?
    @Published var errorMessage: String? = nil
    
    public var wasEverModified: Bool = false {
        didSet {
            validateText()
        }
    }
    public private(set) var isValid: Bool = false
    
    private func validateText() {
        guard let validationRule = self.validationRule else {
            self.isValid = true
            return
        }
        let errorMessage = validationRule(self.text)
        self.errorMessage = self.wasEverModified && errorMessage != nil ? errorMessage : nil
        self.isValid = self.errorMessage == nil
    }
}
