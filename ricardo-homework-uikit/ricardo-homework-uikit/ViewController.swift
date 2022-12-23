//
//  ViewController.swift
//  ricardo-homework-uikit
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import UIKit

class ViewController: UIViewController {
    private static let passwordRequirements = """
            Password must meet the following requirements:
                - At least 8 characters
                - Must contain a letter
                - Must contain a decimal
                - Must contain a special character
            """

    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var usernameErrorLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordErrorLabel: UILabel!
    @IBOutlet var passwordRequirementsLabel: UILabel!
    @IBOutlet var registerButton: UIButton!

    private var isUsernameValid = true {
        didSet {
            usernameErrorLabel.text = isUsernameValid ? " " : "Username not valid"
        }
    }

    private var isPasswordValid = true {
        didSet {
            passwordErrorLabel.text = isPasswordValid ? " " : "Password not valid"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        usernameTextField.addTarget(self, action: #selector(usernameDidChange(_:)), for: .editingChanged)
        usernameTextField.autocorrectionType = .no
        usernameTextField.autocapitalizationType = .none
        usernameErrorLabel.text = " "
        usernameErrorLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        usernameErrorLabel.textColor = .red

        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(passwordDidChange(_:)), for: .editingChanged)
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordErrorLabel.text = " "
        passwordErrorLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        passwordErrorLabel.textColor = .red
        passwordRequirementsLabel.text = Self.passwordRequirements

        scrollView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor).isActive = true
        scrollView.keyboardDismissMode = .onDrag

        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .orange
        registerButton.tintColor = .white
        registerButton.clipsToBounds = true
        registerButton.layer.cornerRadius = 8
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }

    @objc func usernameDidChange(_ sender: UITextField) {
        let username = sender.text ?? ""
        let isValid = !username.isEmpty
        if isValid {
            isUsernameValid = true
        }
    }

    @objc func passwordDidChange(_ sender: UITextField) {
        let password = sender.text ?? ""

        let isValid =
            password.count >= 6 &&
            password.rangeOfCharacter(from: .letters) != nil &&
            password.rangeOfCharacter(from: .decimalDigits) != nil &&
            password.rangeOfCharacter(from: .alphanumerics.inverted) != nil
        if isValid {
            isPasswordValid = true
        }
    }

    @objc func registerButtonTapped() {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        isUsernameValid = !username.isEmpty
        isPasswordValid =
            password.count >= 8 &&
            password.rangeOfCharacter(from: .letters) != nil &&
            password.rangeOfCharacter(from: .decimalDigits) != nil &&
            password.rangeOfCharacter(from: .alphanumerics.inverted) != nil

        guard isUsernameValid && isPasswordValid else {
            return
        }

        showSuccess()
    }

    private func showSuccess() {
        let alert = UIAlertController(
            title: "Registration successful",
            message: nil,
            preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(okAction)
        alert.preferredAction = okAction

        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            let username = textField.text ?? ""
            isUsernameValid = !username.isEmpty
        }
        if textField == passwordTextField {
            let password = textField.text ?? ""

            isPasswordValid =
                password.count >= 6 &&
                password.rangeOfCharacter(from: .letters) != nil &&
                password.rangeOfCharacter(from: .decimalDigits) != nil &&
                password.rangeOfCharacter(from: .symbols) != nil
        }
    }
}
