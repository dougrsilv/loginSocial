//
//  SpyNavigationController.swift
//  DevPoliChallengeTests
//
//  Created by Douglas  Rodrigues  on 17/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class SpyNavigationController: UINavigationController {
    
    var pushViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
}
