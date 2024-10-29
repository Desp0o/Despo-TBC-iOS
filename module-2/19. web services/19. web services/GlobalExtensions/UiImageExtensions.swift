//
//  UiImageExtensions.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//

import UIKit

extension UIImageView {
    func configureImgBasicSettings() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.contentMode = .scaleAspectFill
    }
}
