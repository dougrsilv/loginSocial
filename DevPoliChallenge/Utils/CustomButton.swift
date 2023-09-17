//
//  CustomButton.swift
//  DevPoliChallenge
//
//  Created by Douglas  Rodrigues  on 16/09/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var originalS: CGRect?
    
    open override func awakeFromNib() {
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = 5.0
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.3
    }
    
    func animateButton(shouldLoad: Bool) {
        let sp = UIActivityIndicatorView()
        sp.style = .large
        sp.color = UIColor.white
        sp.alpha = 0.0
        sp.hidesWhenStopped = true
        sp.tag = 21
        if shouldLoad {
            self.addSubview(sp)
            self.setTitle("", for: .normal)
            
            UIView.animate(withDuration: 0.2) {
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2),
                                    y: self.frame.origin.y,
                                    width: self.frame.height,
                                    height: self.frame.height)
            } completion: { (finished) in
                if finished == true {
                    sp.startAnimating()
                    sp.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.width / 2 + 1)
                    sp.fadeTo(alphaView: 1.0, withDuration: 0.2)
                }
            }
            self.isUserInteractionEnabled = false
        } else {
            self.isUserInteractionEnabled = true
            for subView in self.subviews {
                if subView.tag == 21 {
                    subView.removeFromSuperview()
                }
            }
            UIView.animate(withDuration: 0.2) {
                self.layer.cornerRadius = 5.0
                self.frame = self.originalS ?? CGRect()
                self.setTitle("", for: .normal)
            }
        }
    }
}

extension UIView {
    func fadeTo(alphaView: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaView
        }
    }
}
