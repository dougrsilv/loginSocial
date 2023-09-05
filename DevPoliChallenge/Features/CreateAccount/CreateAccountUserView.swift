//
//  CreateAccountUserView.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol CreateAccountUserViewDelegate: AnyObject {
    func habilitOrNotHabilityEnter(isHability: Bool)
}

final class CreateAccountUserView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: CreateAccountUserViewDelegate?
    
    lazy var firstNameAccountUser: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        text.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        text.placeholder = "Primeiro nome"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        text.leftViewMode = .always
        text.heightAnchor.constraint(equalToConstant: 55).isActive = true
        text.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var lastNameAccountUser: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        text.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        text.placeholder = "Último nome"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        text.leftViewMode = .always
        text.heightAnchor.constraint(equalToConstant: 55).isActive = true
        text.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var emailAccountUser: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        text.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        text.placeholder = "Email"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        text.leftViewMode = .always
        text.heightAnchor.constraint(equalToConstant: 55).isActive = true
        text.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var passwordAccountUser: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        text.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        text.placeholder = "Senha"
        text.isSecureTextEntry = true
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        text.leftViewMode = .always
        text.heightAnchor.constraint(equalToConstant: 55).isActive = true
        text.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var confirmPasswordAccountUser: UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        text.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        text.placeholder = "Confirmar senha"
        text.isSecureTextEntry = true
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        text.leftViewMode = .always
        text.heightAnchor.constraint(equalToConstant: 55).isActive = true
        text.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var stackUsers: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstNameAccountUser,
                                                   lastNameAccountUser,
                                                   emailAccountUser,
                                                   passwordAccountUser,
                                                   confirmPasswordAccountUser])
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecyle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(stackUsers)
        
        NSLayoutConstraint.activate([
            stackUsers.topAnchor.constraint(equalTo: topAnchor),
            stackUsers.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackUsers.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackUsers.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func textDidChange(sender: UITextField) {

        guard let firstName = firstNameAccountUser.text else { return }
        guard let lastName = lastNameAccountUser.text else { return }
        guard let email = emailAccountUser.text else { return }
        guard let password = passwordAccountUser.text else { return }
        guard let confirmPassword = confirmPasswordAccountUser.text else { return }

        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            delegate?.habilitOrNotHabilityEnter(isHability: false)
        } else {
            delegate?.habilitOrNotHabilityEnter(isHability: true)
        }
    }
}
