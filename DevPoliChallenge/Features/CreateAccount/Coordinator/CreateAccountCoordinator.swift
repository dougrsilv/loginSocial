//
//  CreateAccountCoordinator.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 30/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class CreateAccountCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = AuthService()
        let viewModel = CreateAccountViewModel(service: service, coordinator: self)
        let createAccount = CreateAccountViewController(createAccountViewModelInput: viewModel)
        navigationController.pushViewController(createAccount, animated: true)
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
}
