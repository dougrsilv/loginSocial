//
//  HomeView.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 16/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Properties
    
    private let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funcitons
    
    private func configureUI() {
        addSubview(name)
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            name.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupData(user: User?) {
        name.text = user?.username
    }
}
