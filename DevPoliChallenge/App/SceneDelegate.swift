//
//  SceneDelegate.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
//        let service = AuthService()
//        let viewModel = LoginViewModel(service: service)
//        let loginViewController = LoginViewController(loginViewModelInput: viewModel)
//        window?.rootViewController = UINavigationController(rootViewController: loginViewController)
//        window?.makeKeyAndVisible()
        self.window = window
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

