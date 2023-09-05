//
//  LoginFieldsLogin.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 18/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol LoginFieldsLoginProtocol: AnyObject {
    func informationLogin(loginModel: LoginModel)
}

final class LoginFieldsLogin: UIView {
    
    // MARK: - Properties
    
    weak var delegate: LoginFieldsLoginProtocol?
    
    private lazy var loginUserLogin: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(red: 0.392, green: 0.71, blue: 0.965, alpha: 1).cgColor
        text.placeholder = "Email"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        text.leftViewMode = .always
        text.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var passwordUserLogin: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        text.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        text.placeholder = "senha"
        text.isSecureTextEntry = true
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        text.leftViewMode = .always
        text.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var forgotPasswordLogin: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Esqueci a senha", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var enterLogin: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(clickButtonEnter), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(loginUserLogin)
        addSubview(passwordUserLogin)
        addSubview(forgotPasswordLogin)
        addSubview(enterLogin)
        
        NSLayoutConstraint.activate([
            loginUserLogin.topAnchor.constraint(equalTo: topAnchor),
            loginUserLogin.leadingAnchor.constraint(equalTo: leadingAnchor),
            loginUserLogin.trailingAnchor.constraint(equalTo: trailingAnchor),
            loginUserLogin.heightAnchor.constraint(equalToConstant: 55),
            
            passwordUserLogin.topAnchor.constraint(equalTo: loginUserLogin.bottomAnchor, constant: 8),
            passwordUserLogin.leadingAnchor.constraint(equalTo: leadingAnchor),
            passwordUserLogin.trailingAnchor.constraint(equalTo: trailingAnchor),
            passwordUserLogin.heightAnchor.constraint(equalToConstant: 55),
            
            forgotPasswordLogin.topAnchor.constraint(equalTo: passwordUserLogin.bottomAnchor, constant: 16),
            forgotPasswordLogin.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            enterLogin.topAnchor.constraint(equalTo: forgotPasswordLogin.bottomAnchor, constant: 22),
            enterLogin.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterLogin.widthAnchor.constraint(equalToConstant: 294),
            enterLogin.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func textDidChange(sender: UITextField) {

        guard let loginUser = loginUserLogin.text else { return }
        guard let passwordUser = passwordUserLogin.text else { return }

        if loginUser.isEmpty || passwordUser.isEmpty {
            enterLogin.isEnabled = false
            enterLogin.backgroundColor = UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)
        } else {
            enterLogin.isEnabled = true
            enterLogin.backgroundColor = UIColor(red: 1, green: 0.655, blue: 0.149, alpha: 1)
        }
    }
    
    @objc func clickButtonEnter() {
        let model = LoginModel(login: loginUserLogin.text ?? "",
                               password: passwordUserLogin.text ?? "")
        delegate?.informationLogin(loginModel: model)
    }
}
