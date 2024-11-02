//
//  UITextFieldExtensions.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

class PaddedTextField: UITextField {
    private let textPadding = UIEdgeInsets(top: 14, left: 8, bottom: 14, right: 0)
    
    func configureCustomTextField(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isSecureTextEntry = true
        self.placeholder = placeholder
        self.backgroundColor = .textFieldBG
        self.layer.cornerRadius = 12
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
}
