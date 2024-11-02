//
//  UIButtonExtensions.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

extension UIButton {
    func configureCustomButton(bgColor: UIColor, btnTitle: String, color: UIColor, fontName: String, fonSize: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 42).isActive = true
        self.layer.cornerRadius = 12
        
        self.backgroundColor = bgColor
        self.setTitle(btnTitle, for: .normal)
        self.titleLabel?.textColor = color
        self.titleLabel?.font = UIFont(name: fontName, size: fonSize)
    }
}
