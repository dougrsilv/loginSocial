//
//  LoginCoordinator.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 30/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = AuthService()
        let viewModel = LoginViewModel(service: service)
        let loginViewController = LoginViewController(loginViewModelInput: viewModel)
        viewModel.coordinator = self
        navigationController.setViewControllers([loginViewController], animated: false)
    }
    
    func createAccountStart() {
        let createAccountCoordinator = CreateAccountCoordinator(navigationController: navigationController)
        createAccountCoordinator.start()
    }
    
    func homeStart() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
    }
}
