//
//  ViewController.swift
//  assigement12
//
//  Created by Despo on 09.10.24.
//

import UIKit

extension UIButton {
    func borderedButton(isDarkMode: Bool) {
        self.layer.cornerRadius = 32
        self.layer.borderWidth = 2
        self.layer.borderColor = isDarkMode ? UIColor(hue: 220/360, saturation: 0.11, brightness: 0.22, alpha: 1).cgColor : UIColor(hue: 0, saturation: 0, brightness: 0.91, alpha: 1).cgColor
    }
    
    func filledButton(isDarkMode: Bool) {
        self.layer.cornerRadius = 32
        self.layer.borderWidth = 2
        self.layer.borderColor = isDarkMode ?  UIColor(hue: 220/360, saturation: 0.11, brightness: 0.22, alpha: 1).cgColor : UIColor(hue: 0, saturation: 0, brightness: 0.91, alpha: 1).cgColor
        self.layer.backgroundColor = isDarkMode ? UIColor(hue: 220/360, saturation: 0.11, brightness: 0.22, alpha: 1).cgColor
        :  UIColor(hue: 0, saturation: 0, brightness: 0.91, alpha: 1).cgColor
    }
}



final class ViewController: UIViewController {
    @IBOutlet weak var firstLabel: UILabel?
    @IBOutlet weak var secondLabel: UILabel?
    @IBOutlet weak var themeIcon: UIButton?
    @IBOutlet weak var percentIcon: UIButton?
    @IBOutlet weak var dividerIcon: UIButton?
    @IBOutlet weak var multipleIcon: UIButton?
    @IBOutlet weak var decrementIcon: UIButton?
    @IBOutlet weak var incrementIcon: UIButton?
    @IBOutlet weak var equalsButtons: UIButton?
    @IBOutlet weak var acButton: UIButton?
    @IBOutlet weak var number1: UIButton?
    @IBOutlet weak var number2: UIButton?
    @IBOutlet weak var number3: UIButton?
    @IBOutlet weak var number4: UIButton?
    @IBOutlet weak var number5: UIButton?
    @IBOutlet weak var number6: UIButton?
    @IBOutlet weak var number7: UIButton?
    @IBOutlet weak var number8: UIButton?
    @IBOutlet weak var number9: UIButton?
    @IBOutlet weak var numPad: UIView!
    
    var isDarkMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func changeThemeColor() {
        isDarkMode = !isDarkMode
        setupInterface()

        if isDarkMode {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }

    
    private func setupUI() {
        gradinetColor()
        addShadow()
        
        switch traitCollection.userInterfaceStyle {
        case .light:
            isDarkMode = false
        case .dark:
            isDarkMode = true
        default:
            isDarkMode = false
        }
        
        setupInterface()

    }
    
    
    
    private func setupInterface() {
        view.backgroundColor = isDarkMode ? UIColor(hue: 220/360, saturation: 0.15, brightness: 0.15, alpha: 1) : UIColor.white
        
        numPad?.backgroundColor = isDarkMode ? UIColor(hue: 220/360, saturation: 0.15, brightness: 0.18, alpha: 1) : UIColor(hue: 0/360, saturation: 0, brightness: 0.96, alpha: 1)
        
        setupCustomButtons()
    }
    
    private func setupCustomButtons() {
        themeIcon?.borderedButton(isDarkMode: isDarkMode)
        themeIcon?.setImage(UIImage(named: isDarkMode ? "sunIcon" : "moonSvg"), for: .normal)
        
        percentIcon?.filledButton(isDarkMode: isDarkMode)
        percentIcon?.setImage(UIImage(named: isDarkMode ? "percentLight" : "percentSvg"), for: .normal)
        
        multipleIcon?.filledButton(isDarkMode: isDarkMode)
        multipleIcon?.setImage(UIImage(named: isDarkMode ? "multipleLight" : "multipleSvg"), for: .normal)
        
        dividerIcon?.filledButton(isDarkMode: isDarkMode)
        dividerIcon?.setImage(UIImage(named: isDarkMode ? "divideLight" : "divideSvg"), for: .normal)
        
        decrementIcon?.filledButton(isDarkMode: isDarkMode)
        decrementIcon?.setImage(UIImage(named: isDarkMode ? "decrementLight" : "decrement"), for: .normal)
        
        incrementIcon?.filledButton(isDarkMode: isDarkMode)
        incrementIcon?.setImage(UIImage(named: isDarkMode ? "incrementLight" : "increment"), for: .normal)
    }
    
    private func gradinetColor() {
        let gradientLayr = CAGradientLayer()
        gradientLayr.frame = equalsButtons?.bounds ?? CGRect.zero
        equalsButtons?.layer.cornerRadius = 32
        gradientLayr.colors = [
            UIColor(hue: 323/360, saturation: 0.94, brightness: 0.93, alpha: 1).cgColor,
            UIColor(hue: 13/360, saturation: 0.82, brightness: 1, alpha: 1).cgColor,
        ]
        gradientLayr.cornerRadius = 32
        equalsButtons?.layer.addSublayer(gradientLayr)
        equalsButtons?.layer.cornerRadius = 32
        
        acButton?.titleLabel?.textColor = UIColor(hue: 323/360, saturation: 0.94, brightness: 0.93, alpha: 1)
    }
    
    private func addShadow() {
        equalsButtons?.layer.shadowColor = UIColor(hue: 351/360, saturation: 0.76, brightness: 0.97, alpha: 0.8).cgColor
        equalsButtons?.layer.shadowOpacity = 1
        equalsButtons?.layer.shadowRadius = 12
        equalsButtons?.layer.shadowOffset = CGSize(width: 0, height: 0)
        equalsButtons?.layer.masksToBounds = false
    }
}


