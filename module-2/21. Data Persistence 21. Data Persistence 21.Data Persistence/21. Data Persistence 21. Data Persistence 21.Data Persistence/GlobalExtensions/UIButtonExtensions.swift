//
//  UIButtonExtensions.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

extension UIButton {
    func configureCustomButton(btnHeight: CGFloat = 0, btnWidth: CGFloat = 0,  bgColor: UIColor, btnTitle: String, color: UIColor, fontName: String, fonSize: CGFloat, borderWidth: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: btnHeight).isActive = true
        self.widthAnchor.constraint(equalToConstant: btnWidth).isActive = true
        self.layer.cornerRadius = 12
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.outlineViolet.cgColor
        
        self.backgroundColor = bgColor
        self.setTitle(btnTitle, for: .normal)
        self.titleLabel?.textColor = color
        self.titleLabel?.font = UIFont(name: fontName, size: fonSize)
    }
}
