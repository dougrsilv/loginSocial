//
//  AppCoordinator.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 30/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator  {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
