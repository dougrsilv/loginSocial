//
//  CreateAccountViewController.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    
    // MARK: - Properties
    
    private let createAccountView = CreateAccountView()
    private var createAccountViewModelInput: CreateAccountViewModelInput
    
    override func loadView() {
        view = createAccountView
    }
    
    init(createAccountViewModelInput: CreateAccountViewModelInput) {
        self.createAccountViewModelInput = createAccountViewModelInput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Criar conta"
        createAccountView.delegate = self
        createAccountViewModelInput.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        //navigationController?.navigationBar.backIndicatorImage = UIImage(named: <#T##String#>)
    }
    
    private func alertUser(title: String, message: String, typeButton: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        switch typeButton {
        case true:
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { alert in
                self.createAccountView.isUserInteractionEnabled = true
                self.createAccountView.setupStartAndStopAnimation(value: false)
            }))
            self.present(alert, animated: true)
        case false:
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { alert in
                self.createAccountViewModelInput.pop()
            }))
            self.present(alert, animated: true)
        }
    }
}

// MARK: - CreateAccountViewDelegate

extension CreateAccountViewController: CreateAccountViewDelegate {
    func openLinkTerms() {
        if let url = URL(string: "https://www.devpoli.com/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func passDataCreateUser(model: CreateUserModel) {
        createAccountViewModelInput.checkDataCreateUser(withCredential: model)
        createAccountView.setupStartAndStopAnimation(value: true)
        createAccountView.isUserInteractionEnabled = false
    }
}

// MARK: - CreateAccountViewModelOutput

extension CreateAccountViewController: CreateAccountViewModelOutput {
    func onFailure(error: ErrorCreateUser) {
        switch error {
        case .invalidEmail:
            alertUser(title: "Ops...", message: "Este email não é válido...", typeButton: true)
        case .direferentPassowrdAndConfirmPassowrd:
            alertUser(title: "Ops...", message: "As senha estão diferentes...", typeButton: true)
        case .errorCreateUser:
            alertUser(title: "Ops...", message: "Algo deu errado...", typeButton: true)
        case .invalidCaracters:
            alertUser(title: "Ops...", message: "A senha deve conter no minimo 5 caracteres...", typeButton: true)
        }
    }
    
    func onSucess() {
        createAccountView.setupStartAndStopAnimation(value: false)
        alertUser(title: "Opa...", message: "Usuário criado com sucesso!!!", typeButton: false)
    }
}
