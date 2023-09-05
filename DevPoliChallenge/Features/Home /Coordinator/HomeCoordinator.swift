//
//  HomeCoordinator.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 30/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
