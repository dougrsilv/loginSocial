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
    private let uid: AuthUser?
    
    init(navigationController: UINavigationController,
         uid: AuthUser?) {
        self.navigationController = navigationController
        self.uid = uid
    }
    
    func start() {
        let service = AuthService()
        let homeViewModel = HomeViewModel(service: service, uid: uid?.uid)
        let homeViewController = HomeViewController(homeViewModel: homeViewModel)
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
