//
//  ViewController.swift
//  Assigmenet1
//
//  Created by Despo on 06.10.24.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var firstField: UITextField?
    @IBOutlet weak var secondField: UITextField?
    @IBOutlet weak var result: UILabel?
    @IBOutlet weak var themeIcon: UIImageView?
    
    var dividerMode = false
    var isDarkMode = false
    var firstNumber = 0
    var secondNumber = 0
    var finalResult = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction private func changdeDividerMode() {
        dividerMode = !dividerMode
        changeTitleLabel()
    }
    
    @IBAction private func setFirstNum() {
        let fieldValue = firstField?.text ?? ""
        
        if checkRegex(input: fieldValue) {
            firstNumber = Int(fieldValue) ?? 0
        }
    }
    
    @IBAction private func setSecondNum() {
        let fieldValue = secondField?.text ?? ""
        
        if checkRegex(input: fieldValue) {
            secondNumber = Int(fieldValue) ?? 0
        }
    }
    
    private func setupUI() {
        changdeDividerMode()
        setupGesture()
        changeTheme()
        
        switch traitCollection.userInterfaceStyle {
        case .light:
            isDarkMode = false
        case .dark:
            isDarkMode = true
        default:
            isDarkMode = false
        }
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeTheme))
        
        themeIcon?.isUserInteractionEnabled = true
        themeIcon?.addGestureRecognizer(tapGesture)
    }
    
    @objc private func changeTheme() {
        isDarkMode = !isDarkMode
        
        if isDarkMode {
            themeIcon?.image = UIImage(systemName: "sun.max.fill")
            themeIcon?.tintColor = .yellow
            
            firstField?.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            secondField?.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            
            overrideUserInterfaceStyle = .dark
        } else {
            themeIcon?.tintColor = .systemBlue
            themeIcon?.image = UIImage(systemName: "moon.fill")
            
            firstField?.backgroundColor = UIColor.clear
            secondField?.backgroundColor = UIColor.clear
            
            overrideUserInterfaceStyle = .light
        }
    }
    
    private func checkRegex(input: String) -> Bool {
        let keyAndValue = "^[0-9]+$"
        
        if input.range(of: keyAndValue, options: .regularExpression) != nil {
            return true
        } else {
            return false
        }
    }
    
    private func changeTitleLabel() {
        titleLabel?.text = dividerMode ? "ნაშთიანი გაყოფა" : "უნაშთო გაყოფა"
    }
    
    @IBAction private func calculate() {
        if secondNumber == 0 {
            result?.text = "ნულზე გაყოფია არ შეიძლება"
        } else {
            if dividerMode {
                finalResult = firstNumber % secondNumber
            } else {
                finalResult = firstNumber / secondNumber
            }
            
            result?.text = String(finalResult)
        }
    }
}

