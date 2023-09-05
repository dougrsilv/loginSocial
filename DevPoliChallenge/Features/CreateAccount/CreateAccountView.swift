//
//  CreateAccountView.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol CreateAccountViewDelegate: AnyObject {
    func passDataCreateUser(model: CreateUserModel)
    func openLinkTerms()
}

final class CreateAccountView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: CreateAccountViewDelegate?
    
    private lazy var subTitleCreateAccount: UILabel = {
        let label = UILabel()
        label.text = "Cria sua conta e comece a gerenciar sua vida financeira"
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createAccountUserView: CreateAccountUserView = {
        let view = CreateAccountUserView()
        view.delegate = self
        view.heightAnchor.constraint(equalToConstant: 307).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var termsOfUsAccount: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Ao criar a conta, você concorda com\n nossos", secondPart: " termos e condições de uso")
        button.titleLabel?.numberOfLines = 0
        button.addTarget(self, action: #selector(clickTermsOfUs), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var createAccount: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(clickCreateAccount), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.style = .large
        //activity.startAnimating()
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
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
    
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(subTitleCreateAccount)
        contentView.addSubview(createAccountUserView)
        contentView.addSubview(termsOfUsAccount)
        contentView.addSubview(createAccount)
        contentView.addSubview(activity)
        
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
            
            subTitleCreateAccount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            subTitleCreateAccount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 29),
            subTitleCreateAccount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            createAccountUserView.topAnchor.constraint(equalTo: subTitleCreateAccount.bottomAnchor, constant: 37),
            createAccountUserView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            createAccountUserView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            createAccountUserView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -331),
            
            termsOfUsAccount.topAnchor.constraint(equalTo: createAccountUserView.bottomAnchor, constant: 181),
            termsOfUsAccount.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            createAccount.topAnchor.constraint(equalTo: termsOfUsAccount.bottomAnchor, constant: 12),
            createAccount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 48),
            createAccount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
            createAccount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -52),
            createAccount.heightAnchor.constraint(equalToConstant: 50),
            
            activity.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    @objc func clickTermsOfUs() {
        delegate?.openLinkTerms()
    }
    
    @objc func clickCreateAccount() {
        let model = CreateUserModel(firsName: createAccountUserView.firstNameAccountUser.text ?? "",
                                    lastName: createAccountUserView.lastNameAccountUser.text ?? "",
                                    email: createAccountUserView.emailAccountUser.text ?? "",
                                    password: createAccountUserView.passwordAccountUser.text ?? "",
                                    confirmPassword: createAccountUserView.confirmPasswordAccountUser.text ?? "")
        delegate?.passDataCreateUser(model: model)
    }
    
    func setupStartAndStopAnimation(value: Bool) {
        
        switch value {
        case true:
            activity.startAnimating()
        case false:
            activity.stopAnimating()
        }
    }
}

extension CreateAccountView: CreateAccountUserViewDelegate {
    func habilitOrNotHabilityEnter(isHability: Bool) {
        switch isHability {
        case false:
            createAccount.isEnabled = false
            createAccount.backgroundColor = UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)
        case true:
            createAccount.isEnabled = true
            createAccount.backgroundColor = UIColor(red: 1, green: 0.655, blue: 0.149, alpha: 1)
        }
    }
}
