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
    func navigationHome(uid: AuthUser?)
}

protocol LoginViewModelOutput: AnyObject {
    func onFailure()
    func onSuccess(uid: AuthUser?)
}

final class LoginViewModel: LoginViewModelInput {
    
    weak var delegate: LoginViewModelOutput?
    private let service: AuthServiceProtocol
    var coordinator: LoginCoordinator?
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func fetchListLogin(email: String, password: String) {
        service.logUserIn(email: email, password: password) { [weak self] resul, error in
            guard let self = self else { return }
            if error != nil {
                self.delegate?.onFailure()
                return
            }
            self.delegate?.onSuccess(uid: resul)
        }
    }
    
    func navigationCreateAccount() {
        coordinator?.createAccountStart()
    }
    
    func navigationHome(uid: AuthUser?) {
        coordinator?.homeStart(uid: uid)
    }
}
