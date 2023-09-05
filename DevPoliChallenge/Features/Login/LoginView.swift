//
//  LoginView.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 17/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func loginData(loginModel: LoginModel)
    func createNewAccount()
}

final class LoginView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: LoginViewProtocol?
    
    private lazy var titleScreenLogin: UILabel = {
        let label = UILabel()
        label.text = "Olá! \nQuer melhorar sua vida financeira?"
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto-Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleScreenLogin: UILabel = {
        let label = UILabel()
        label.text = "Identifique-se e fique por dentro de todas as novidaes!"
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginFieldsLogin: LoginFieldsLogin = {
        let view = LoginFieldsLogin()
        view.delegate = self
        view.heightAnchor.constraint(equalToConstant: 230).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lineLeftLogin: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1)
        view.bounds = view.bounds.insetBy(dx: -2, dy: -2)
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var messageMidia: UILabel = {
        let label = UILabel()
        label.text = "Entre com"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 0.438, green: 0.438, blue: 0.438, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lineRightLogin: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1)
        view.bounds = view.bounds.insetBy(dx: -2, dy: -2)
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonSocialMediaLogin: ButtonSocialMediaLogin = {
        let view = ButtonSocialMediaLogin()
        view.heightAnchor.constraint(equalToConstant: 55).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Não tem conta?", secondPart: " Criar conta")
        button.addTarget(self, action: #selector(clickNewAccount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
        setupKeyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleScreenLogin)
        contentView.addSubview(subTitleScreenLogin)
        contentView.addSubview(loginFieldsLogin)
        contentView.addSubview(lineLeftLogin)
        contentView.addSubview(messageMidia)
        contentView.addSubview(lineRightLogin)
        contentView.addSubview(buttonSocialMediaLogin)
        contentView.addSubview(dontHaveAccountButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleScreenLogin.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            titleScreenLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            titleScreenLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            
            subTitleScreenLogin.topAnchor.constraint(equalTo: titleScreenLogin.bottomAnchor, constant: 19),
            subTitleScreenLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            subTitleScreenLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            
            loginFieldsLogin.topAnchor.constraint(equalTo: subTitleScreenLogin.bottomAnchor, constant: 102),
            loginFieldsLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            loginFieldsLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            
            lineLeftLogin.topAnchor.constraint(equalTo: loginFieldsLogin.bottomAnchor, constant: 68),
            lineLeftLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            lineLeftLogin.widthAnchor.constraint(equalToConstant: 114),
            lineLeftLogin.heightAnchor.constraint(equalToConstant: 5),

            messageMidia.topAnchor.constraint(equalTo: loginFieldsLogin.bottomAnchor, constant: 59),
            messageMidia.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            lineRightLogin.topAnchor.constraint(equalTo: loginFieldsLogin.bottomAnchor, constant: 68),
            lineRightLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            lineRightLogin.widthAnchor.constraint(equalToConstant: 114),
            lineRightLogin.heightAnchor.constraint(equalToConstant: 5),
            
            buttonSocialMediaLogin.topAnchor.constraint(equalTo: messageMidia.topAnchor, constant: 36),
            buttonSocialMediaLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            buttonSocialMediaLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            
            dontHaveAccountButton.topAnchor.constraint(equalTo: buttonSocialMediaLogin.bottomAnchor, constant: 76),
            dontHaveAccountButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dontHaveAccountButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        endEditing(true)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.frame.origin.y = -20
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.frame.origin.y = 0
    }
    
    @objc func clickNewAccount() {
        delegate?.createNewAccount()
    }
}

extension LoginView: LoginFieldsLoginProtocol {
    func informationLogin(loginModel: LoginModel) {
        delegate?.loginData(loginModel: loginModel)
    }
}
