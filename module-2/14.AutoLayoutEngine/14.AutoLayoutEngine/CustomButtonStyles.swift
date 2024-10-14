//
//  CustomButtonStyles.swift
//  14.AutoLayoutEngine
//
//  Created by Despo on 14.10.24.
//

import UIKit

final class CalcButton: UIButton {
        
    init() {
        super.init(frame: .zero)
        buttonCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buttonCornerRadius() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
        
    func setupButtonsUI(name: String = "", isDarkMode: Bool = false, isFilled: Bool = false, isBordered: Bool = false, iconLight: String = "", iconDark: String = "") {
        let darkModeColor = UIColor(hue: 220/360, saturation: 0.11, brightness: 0.22, alpha: 1).cgColor
        let lightModeColor = UIColor(hue: 0, saturation: 0, brightness: 0.91, alpha: 1).cgColor
        
        if !name.isEmpty {
            self.setTitle(name, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        }

        if isFilled {
            self.layer.backgroundColor = isDarkMode ? darkModeColor : lightModeColor
        }

        if isBordered {
            self.layer.borderWidth = 2
            self.layer.borderColor = isDarkMode ? darkModeColor : lightModeColor
        }

        if !iconDark.isEmpty {
            self.setImage(UIImage(named: isDarkMode ? iconLight : iconDark), for: .normal)
        }
    }
    
    func updatetextColor(isDarkMode: Bool) {
        self.setTitleColor(isDarkMode ? .white : .black, for: .normal)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        buttonCornerRadius()
    }
}
