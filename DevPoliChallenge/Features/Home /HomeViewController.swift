//
//  HomeViewController.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
