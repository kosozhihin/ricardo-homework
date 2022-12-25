//
//  ricardo_homework_FieldValidatorTests.swift
//  ricardo-homework-swiftuiTests
//
//  Created by Aleksei Kosozhikhin on 25.12.22.
//

import XCTest
@testable import ricardo_homework_swiftui

final class ricardo_homework_FieldValidatorTests: XCTestCase {
    func test_WhenValidateUsernameCalledWithAnyNonEmptyString_ReturnsNil() throws {
        // Arrange
        let fieldValidator = FieldValidator()
        let validInput = "TestString"
        
        // Act
        let result = fieldValidator.validateUsername(username: validInput)
        
        // Assert
        XCTAssertEqual(result, nil, "Call result is not nil.")
    }
    
    func test_WhenValidateUsernameCalledWithEmptyString_ReturnsErrorMessage() throws {
        // Arrange
        let fieldValidator = FieldValidator()
        let invalidInput = ""
        let expectedErrorMessage = "Username not valid"
        
        // Act
        let result = fieldValidator.validateUsername(username: invalidInput)
        
        // Assert
        XCTAssertEqual(result, expectedErrorMessage, "Call result is not the expected error message.")
    }
    
    func test_WhenValidatePasswordCalledWithValidPassword_ReturnsNil() throws {
        // Arrange
        let fieldValidator = FieldValidator()
        let validInput = "password1!"
        
        // Act
        let result = fieldValidator.validatePassword(password: validInput)
        
        // Assert
        XCTAssertEqual(result, nil, "Call result is not nil.")
    }
    
    func test_WhenValidatePasswordCalledWithInvalidPassword_ReturnsErrorMessage() throws {
        // Arrange
        let fieldValidator = FieldValidator()
        let invalidTestCases = [
            (input: "pa1!", testCase: "Password too short"),
            (input: "password1", testCase: "Password has no special symbols"),
            (input: "12345678!", testCase: "Password has no letters"),
            (input: "password!", testCase: "Password has no numbers"),
        ]
        let expectedErrorMessage = "Password not valid"
        
        for (input, testCase) in invalidTestCases {
            XCTContext.runActivity(named: "Testing whether \(testCase)") { activity in
                // Act
                let result = fieldValidator.validatePassword(password: input)
                
                // Assert
                XCTAssertEqual(result, expectedErrorMessage, "Call result is not the expected error message.")
            }
        }
    }
}
