//
//  UiLabelExtensions.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//

import UIKit

extension UILabel {
    func configureScreenTitle(with text: String, size: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = true
        
        self.text = text
        self.textColor = UIColor.black
        self.font = UIFont(name: "Anek-bold", size: size)
    }
    
    func configureNunitoLabels(with text: String, fontName: String, color: UIColor, size: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = true
        
        self.text = text
        self.textColor = color
        self.font = UIFont(name: fontName, size: size)
    }
}
