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
    
    private var homeViewModel: HomeViewModelInput
    private let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    init(homeViewModel: HomeViewModelInput) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        homeViewModel.delegate = self
        homeViewModel.fechtUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension HomeViewController: HomeViewModelOutput {
    func onSuccess(user: User?) {
        homeView.setupData(user: user)
    }
    
    func onFailure() {
        //
    }
}
