//
//  LoginViewController.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 17/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let loginView = LoginView()
    private var loginViewModelInput: LoginViewModelInput
    
    override func loadView() {
        view = loginView
    }
    
    init(loginViewModelInput: LoginViewModelInput) {
        self.loginViewModelInput = loginViewModelInput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        loginViewModelInput.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func alertUser() {
        let alert = UIAlertController(title: "Ops...", message: "Usuário ou senha inválido", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
    }
}

extension LoginViewController: LoginViewProtocol {
 
    func loginData(loginModel: LoginModel) {
        loginViewModelInput.fetchListLogin(email: loginModel.login,
                                           password: loginModel.password)
    }
    
    func createNewAccount() {
        loginViewModelInput.navigationCreateAccount()
    }
}

extension LoginViewController: LoginViewModelOutput {
    func onFailure() {
        alertUser()
    }
    
    func onSuccess() {
        loginViewModelInput.navigationHome()
    }
}
