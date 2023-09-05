//
//  ButtonSocialMediaLogin.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 18/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class ButtonSocialMediaLogin: UIView {
    
    // MARK: - Properties
    
    private lazy var buttonFacebook: UIButton = {
        let button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        button.addTarget(self, action: #selector(clickButtonFacebook), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonApple: UIButton = {
        let button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        button.addTarget(self, action: #selector(clickButtonApple), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackButtons: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonFacebook, buttonApple])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var imageFacebook: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon-facebook")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleFacebookButton: UILabel = {
        let label = UILabel()
        label.text = "Facebook"
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageApple: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon-apple")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleAppleButton: UILabel = {
        let label = UILabel()
        label.text = "Apple"
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(stackButtons)
        buttonFacebook.addSubview(imageFacebook)
        buttonFacebook.addSubview(titleFacebookButton)
        buttonApple.addSubview(imageApple)
        buttonApple.addSubview(titleAppleButton)
        
        NSLayoutConstraint.activate([
            stackButtons.topAnchor.constraint(equalTo: topAnchor),
            stackButtons.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackButtons.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackButtons.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageFacebook.topAnchor.constraint(equalTo: buttonFacebook.topAnchor , constant: 16),
            imageFacebook.leadingAnchor.constraint(equalTo: buttonFacebook.leadingAnchor, constant: 16),
            imageFacebook.bottomAnchor.constraint(equalTo: buttonFacebook.bottomAnchor, constant: -17),
            
            titleFacebookButton.topAnchor.constraint(equalTo: buttonFacebook.topAnchor, constant: 18),
            titleFacebookButton.leadingAnchor.constraint(equalTo: imageFacebook.trailingAnchor, constant: 8),
            titleFacebookButton.bottomAnchor.constraint(equalTo: buttonFacebook.bottomAnchor, constant: -19),
            
            imageApple.topAnchor.constraint(equalTo: buttonApple.topAnchor , constant: 16),
            imageApple.leadingAnchor.constraint(equalTo: buttonApple.leadingAnchor, constant: 16),
            imageApple.bottomAnchor.constraint(equalTo: buttonApple.bottomAnchor, constant: -17),
            
            titleAppleButton.topAnchor.constraint(equalTo: buttonApple.topAnchor, constant: 18),
            titleAppleButton.leadingAnchor.constraint(equalTo: imageApple.trailingAnchor, constant: 8),
            titleAppleButton.bottomAnchor.constraint(equalTo: buttonApple.bottomAnchor, constant: -19),
        ])
    }
    
    @objc func clickButtonFacebook() {
        print("teste botão facebook")
    }
    
    @objc func clickButtonApple() {
        print("teste botão Apple")
    }
}
