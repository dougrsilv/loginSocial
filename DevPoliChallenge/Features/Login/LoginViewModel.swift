//
//  LoginViewModel.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 21/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol LoginViewModelInput {
    var delegate: LoginViewModelOutput? { get set}
    func fetchListLogin(email: String, password: String)
    func navigationCreateAccount()
    func navigationHome()
}

protocol LoginViewModelOutput: AnyObject {
    func onFailure()
    func onSuccess()
}

final class LoginViewModel: LoginViewModelInput {
    
    weak var delegate: LoginViewModelOutput?
    private let service: AuthServiceProtocol
    private let coordinator: LoginCoordinator
    
    init(service: AuthServiceProtocol, coordinator: LoginCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func fetchListLogin(email: String, password: String) {
        service.logUserIn(email: email, password: password) { [weak self] resul, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if error != nil {
                    self.delegate?.onFailure()
                    return
                }
                self.delegate?.onSuccess()
            }
        }
    }
    
    func navigationCreateAccount() {
        coordinator.createAccountStart()
    }
    
    func navigationHome() {
        coordinator.homeStart()
    }
}
