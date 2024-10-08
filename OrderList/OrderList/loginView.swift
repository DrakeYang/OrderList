//
//  loginView.swift
//  OrderList
//
//  Created by YongMo Yang on 2024/08/24.
//

import Foundation
import UIKit

protocol LoginProtocol {
    func showOrderListVC(mainVC:UIViewController)
}

class LoginView: UIView {
    var mainVC:UIViewController? = nil

    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()


    func setupLayout() {
        self.addSubview(usernameTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)

        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),

            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),

            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func loginButtonTapped() {
//        guard let username = usernameTextField.text, !username.isEmpty,
//              let password = passwordTextField.text, !password.isEmpty else {
//            print("Username and password must not be empty")
//            return
//        }
        // 지금은 무조껀 로그인 통과
        let orderListVC = OrderListVC()
        orderListVC.modalPresentationStyle = .fullScreen
        mainVC?.present(orderListVC, animated: true)
    }
}
