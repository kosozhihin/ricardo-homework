//
//  ricardo_homework_TextFieldWithErrorViewmodelTests.swift
//  ricardo-homework-swiftuiTests
//
//  Created by Aleksei Kosozhikhin on 25.12.22.
//

import XCTest
@testable import ricardo_homework_swiftui

class ricardo_homework_TextFieldWithErrorViewmodelTests: XCTestCase {
    func test_WhenInitIsCalled_DefaultPropertyValuesAreSet() throws {
        // Arrange
        let title = "TestTitle"
        
        // Act
        let viewmodel = TextFieldWithErrorViewmodel(title: title)
        
        // Assert
        XCTAssertEqual(viewmodel.title, title, "The title property has an invalid value.")
        XCTAssertEqual(viewmodel.text, "", "The text property is not an empty string.")
        XCTAssertEqual(viewmodel.errorMessage, nil, "The errorMessage property is not nil.")
        XCTAssertEqual(viewmodel.wasEverModified, false, "The wasEverModified property is not false.")
        XCTAssertEqual(viewmodel.isValid, true, "The isValid property is not true.")
    }
    
    func test_WhenInitIsCalledWithValidationRuleParameter_IsValidPropertyIsSetToFalse() throws {
        // Arrange
        let title = "TestTitle"
        let validationRule = {(text: String) -> String? in
            return nil
        }
        
        // Act
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)
        
        // Assert
        XCTAssertEqual(viewmodel.isValid, false, "The isValid property is not false.")
    }
    
    func test_WhenValidationRuleNotSetAndTextIsChanged_PropertiesDontChange() throws {
        // Arrange
        let title = "TestTitle"
        let viewmodel = TextFieldWithErrorViewmodel(title: title)
        let text = "TestText"
        
        // Act
        viewmodel.text = text
        
        // Assert
        XCTAssertEqual(viewmodel.isValid, true, "The wasEverModified property is not false.")
        XCTAssertEqual(viewmodel.errorMessage, nil, "The errorMessage property is not nil.")
    }
    
    func test_WhenValidationRuleIsSetAndWasEverModifiedIsFalseAndTextIsChanged_PropertiesDontChange() throws {
        // Arrange
        let title = "TestTitle"
        let text = "TestText"
        let errorMessage = "TestErrorMessage"
        let validationRule = {(inputText: String) -> String? in
            return inputText != text ? errorMessage : nil
        }
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)
        
        // Act
        viewmodel.wasEverModified = false
        viewmodel.text = text
        
        // Assert
        XCTAssertEqual(viewmodel.isValid, true, "The wasEverModified property is not false.")
        XCTAssertEqual(viewmodel.errorMessage, nil, "The errorMessage property is not nil.")
    }
    
    func test_WhenValidationRuleIsSetAndWasEverModifiedIsTrueAndTextIsChangedToValid_IsValidIsTrue() throws {
        // Arrange
        let title = "TestTitle"
        let text = "TestText"
        let errorMessage = "TestErrorMessage"
        let validationRule = {(inputText: String) -> String? in
            return inputText != text ? errorMessage : nil
        }
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)
        
        // Act
        viewmodel.wasEverModified = true
        viewmodel.text = text
        
        // Assert
        XCTAssertEqual(viewmodel.isValid, true, "The isValid property is not true.")
    }
    
    func test_WhenValidationRuleIsSetAndWasEverModifiedIsTrueAndTextIsChangedToValid_ErrorMessageIsNil() throws {
        // Arrange
        let title = "TestTitle"
        let text = "TestText"
        let errorMessage = "TestErrorMessage"
        let validationRule = {(inputText: String) -> String? in
            return inputText != text ? errorMessage : nil
        }
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)

        // Act
        viewmodel.wasEverModified = true
        viewmodel.text = text

        // Assert
        XCTAssertEqual(viewmodel.errorMessage, nil, "The errorMessage property is not nil.")
    }
    
    func test_WhenValidationRuleIsSetAndWasEverModifiedIsTrueAndTextIsChangedToInvalid_IsValidIsFalse() throws {
        // Arrange
        let title = "TestTitle"
        let validText = "TestText"
        let invalidText = "InvalidText"
        let errorMessage = "TestErrorMessage"
        let validationRule = {(text: String) -> String? in
            return text != validText ? errorMessage : nil
        }
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)
        
        // Act
        viewmodel.wasEverModified = true
        viewmodel.text = invalidText
        
        // Assert
        XCTAssertEqual(viewmodel.isValid, false, "The isValid property is not false.")
    }
    
    func test_WhenValidationRuleIsSetAndWasEverModifiedIsTrueAndTextIsChangedToInvalid_ErrorMessageIsSet() throws {
        // Arrange
        let title = "TestTitle"
        let validText = "TestText"
        let invalidText = "InvalidText"
        let errorMessage = "TestErrorMessage"
        let validationRule = {(text: String) -> String? in
            return text != validText ? errorMessage : nil
        }
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)

        // Act
        viewmodel.wasEverModified = true
        viewmodel.text = invalidText
        
        // Assert
        XCTAssertEqual(viewmodel.errorMessage, errorMessage, "The errorMessage property is not as expected.")
    }
    
    func test_WhenValidationRuleIsSetAndTextIsSetToInvalidAndWasEverIsChangedToFalse_IsValidIsTrue() throws {
        // Arrange
        let title = "TestTitle"
        let validText = "TestText"
        let invalidText = "InvalidText"
        let errorMessage = "TestErrorMessage"
        let validationRule = {(text: String) -> String? in
            return text != validText ? errorMessage : nil
        }
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)
        
        // Act
        viewmodel.wasEverModified = true
        viewmodel.text = invalidText
        viewmodel.wasEverModified = false
        
        // Assert
        XCTAssertEqual(viewmodel.isValid, true, "The isValid property is not true.")
    }
    
    func test_WhenValidationRuleIsSetAndTextIsSetToInvalidAndWasEverIsChangedToFalse_ErrorMessageIsNil() throws {
        // Arrange
        let title = "TestTitle"
        let validText = "TestText"
        let invalidText = "InvalidText"
        let errorMessage = "TestErrorMessage"
        let validationRule = {(text: String) -> String? in
            return text != validText ? errorMessage : nil
        }
        let viewmodel = TextFieldWithErrorViewmodel(title: title, validationRule: validationRule)

        // Act
        viewmodel.wasEverModified = true
        viewmodel.text = invalidText
        viewmodel.wasEverModified = false

        // Assert
        XCTAssertEqual(viewmodel.errorMessage, nil, "The errorMessage property is not nil.")
    }
}
