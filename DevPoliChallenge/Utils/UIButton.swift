//
//  UIButton.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 18/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

extension UIButton {
    
    func attributedTitle(firstPart: String, secondPart: String) {
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1), .font: UIFont(name: "Roboto-Regular", size: 15) ??  UIFont.systemFont(ofSize: 15)]
        let attributedTitle = NSMutableAttributedString(string: "\(firstPart)", attributes: atts)
        let linkAtts:  [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 0.098, green: 0.463, blue: 0.824, alpha: 1), .font: UIFont.boldSystemFont(ofSize: 15)]
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: linkAtts))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
