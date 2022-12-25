//
//  ricardo_homework_RegistrationScreenUITests.swift
//  ricardo-homework-swiftuiUITests
//
//  Created by Aleksei Kosozhikhin on 25.12.22.
//

import XCTest

class ricardo_homework_RegistrationScreenUITests: XCTestCase {
    func test_WhenAppIsLaunched_TextFieldsAreEmpty() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")
        
        // We have to test for the placeholder instead of the actual text here
        // because we get the placeholder value back when there's no text yet
        XCTAssertEqual(usernameTextField.placeholderValue, "Username")
        XCTAssertEqual(usernameTextField.value as? String, usernameTextField.placeholderValue)
        
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")
        
        // See above
        XCTAssertEqual(passwordTextField.placeholderValue, "Password")
        XCTAssertEqual(passwordTextField.value as? String, passwordTextField.placeholderValue)
    }
    
    func test_WhenAppIsLaunched_ErrorLabelsAreEmpty() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameErrorLabel = app.staticTexts["usernameTextField"]
        XCTAssertTrue(usernameErrorLabel.waitForExistence(timeout: timeout), "Username error label not found")
        
        XCTAssertEqual(usernameErrorLabel.label, " ")
        
        let passwordErrorLabel = app.staticTexts["passwordTextField"]
        XCTAssertTrue(passwordErrorLabel.waitForExistence(timeout: timeout), "Password error label not found")
        
        XCTAssertEqual(passwordErrorLabel.label, " ")
    }
    
    func test_WhenTextIsEnteredToUsernameTextField_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")
        let usernameErrorLabel = app.staticTexts["usernameTextField"]
        XCTAssertTrue(usernameErrorLabel.waitForExistence(timeout: timeout), "Username error label not found")
        
        usernameTextField.tap()
        usernameTextField.typeText("Test")
        
        XCTAssertEqual(usernameErrorLabel.label, " ")
    }
    
    func test_WhenNoTextIsEnteredToUsernameTextFieldAndUserNavigatesAway_AnErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")
        let usernameErrorLabel = app.staticTexts["usernameTextField"]
        XCTAssertTrue(usernameErrorLabel.waitForExistence(timeout: timeout), "Username error label not found")
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")

        usernameTextField.tap()
        passwordTextField.tap()
        
        XCTAssertEqual(usernameErrorLabel.label, "Username not valid")
    }
    
    func test_WhenTextIsEnteredToUsernameTextFieldAndUserNavigatesAway_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")
        let usernameErrorLabel = app.staticTexts["usernameTextField"]
        XCTAssertTrue(usernameErrorLabel.waitForExistence(timeout: timeout), "Username error label not found")
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")

        usernameTextField.tap()
        usernameTextField.typeText("TestText")
        passwordTextField.tap()
        
        XCTAssertEqual(usernameErrorLabel.label, " ")
    }
    
    func test_WhenTextIsEnteredToPasswordTextFieldForFirstTime_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")
        let passwordErrorLabel = app.staticTexts["passwordTextField"]
        XCTAssertTrue(passwordErrorLabel.waitForExistence(timeout: timeout), "Password error label not found")
        
        passwordTextField.tap()
        passwordTextField.typeText("Test")
        
        XCTAssertEqual(passwordErrorLabel.label, " ")
    }
    
    func test_WhenInvalidPasswordIsEnteredToPasswordTextFieldAndUserNavigatesAway_AnErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")
        let passwordErrorLabel = app.staticTexts["passwordTextField"]
        XCTAssertTrue(passwordErrorLabel.waitForExistence(timeout: timeout), "Password error label not found")
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")

        passwordTextField.tap()
        passwordTextField.typeText("Test")
        usernameTextField.tap()
        
        XCTAssertEqual(passwordErrorLabel.label, "Password not valid")
    }
    
    func test_WhenValidPasswordIsEnteredToPasswordTextFieldAndUserNavigatesAway_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")
        let passwordErrorLabel = app.staticTexts["passwordTextField"]
        XCTAssertTrue(passwordErrorLabel.waitForExistence(timeout: timeout), "Password error label not found")
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")

        passwordTextField.tap()
        passwordTextField.typeText("password1!")
        usernameTextField.tap()
        
        XCTAssertEqual(passwordErrorLabel.label, " ")
    }
    
    func test_WhenNoTextIsEnteredToUsernameTextFieldAndUserTapsRegistrationButton_AnErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameErrorLabel = app.staticTexts["usernameTextField"]
        XCTAssertTrue(usernameErrorLabel.waitForExistence(timeout: timeout), "Username error label not found")
        let registrationButton = app.buttons["registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: timeout), "Registration button not found")

        registrationButton.tap()
        
        XCTAssertEqual(usernameErrorLabel.label, "Username not valid")
    }
    
    func test_WhenTextIsEnteredToUsernameTextFieldAndUserTapsRegistrationButton_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")
        let usernameErrorLabel = app.staticTexts["usernameTextField"]
        XCTAssertTrue(usernameErrorLabel.waitForExistence(timeout: timeout), "Username error label not found")
        let registrationButton = app.buttons["registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: timeout), "Registration button not found")

        usernameTextField.tap()
        usernameTextField.typeText("TestText")
        registrationButton.tap()
        
        XCTAssertEqual(usernameErrorLabel.label, " ")
    }
    
    func test_WhenInvalidPasswordIsEnteredToPasswordTextFieldAndUserTapsRegistrationButton_AnErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")
        let passwordErrorLabel = app.staticTexts["passwordTextField"]
        XCTAssertTrue(passwordErrorLabel.waitForExistence(timeout: timeout), "Password error label not found")
        let registrationButton = app.buttons["registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: timeout), "Registration button not found")

        passwordTextField.tap()
        passwordTextField.typeText("Test")
        registrationButton.tap()
        
        XCTAssertEqual(passwordErrorLabel.label, "Password not valid")
    }
    
    func test_WhenValidPasswordIsEnteredToPasswordTextFieldAndUserTapsRegistrationButton_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")
        let passwordErrorLabel = app.staticTexts["passwordTextField"]
        XCTAssertTrue(passwordErrorLabel.waitForExistence(timeout: timeout), "Password error label not found")
        let registrationButton = app.buttons["registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: timeout), "Registration button not found")

        passwordTextField.tap()
        passwordTextField.typeText("password1!")
        registrationButton.tap()
        
        XCTAssertEqual(passwordErrorLabel.label, " ")
    }
    
    func test_WhenNoUsernameIsEnteredAndErrorWasShownAndUsernameChangedToValidOne_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: timeout), "Username field not found")
        let usernameErrorLabel = app.staticTexts["usernameTextField"]
        XCTAssertTrue(usernameErrorLabel.waitForExistence(timeout: timeout), "Username error label not found")
        let registrationButton = app.buttons["registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: timeout), "Registration button not found")

        usernameTextField.tap()
        registrationButton.tap()
        usernameTextField.tap()
        usernameTextField.typeText("TestText")

        XCTAssertEqual(usernameErrorLabel.label, " ")
    }
    
    func test_WhenInvalidPasswordIsEnteredAndErrorWasShownAndPasswordChangedToValidOne_NoErrorIsShown() throws {
        let timeout = 5.0

        let app = XCUIApplication()
        app.launch()
        
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: timeout), "Password field not found")
        let passwordErrorLabel = app.staticTexts["passwordTextField"]
        XCTAssertTrue(passwordErrorLabel.waitForExistence(timeout: timeout), "Password error label not found")
        let registrationButton = app.buttons["registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: timeout), "Registration button not found")

        passwordTextField.tap()
        passwordTextField.typeText("Test")
        registrationButton.tap()
        passwordTextField.tap()
        passwordTextField.typeText("password1!")

        XCTAssertEqual(passwordErrorLabel.label, " ")
    }
}
