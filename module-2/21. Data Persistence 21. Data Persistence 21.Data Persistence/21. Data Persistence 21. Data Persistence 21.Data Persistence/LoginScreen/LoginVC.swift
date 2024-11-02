//
//  ViewViewController.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

class LoginVC: UIViewController {
    private let inputStacks = UIStackView()
    private let avatar = UIImageView()
    private let loginButton = UIButton(type: .custom)
    private let userNameTxtField = PaddedTextField()
    private let passwordTxtField = PaddedTextField()
    private let confirmPasswdTxtField = PaddedTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        setupAvatarUpload()
        setupInputs()
        configureInput(textField: userNameTxtField, labelText: "Username", placeholder: "Enter username")
        configureInput(textField: passwordTxtField, labelText: "Password", placeholder: "Enter password")
        configureInput(textField: confirmPasswdTxtField, labelText: "Confirm password", placeholder: "Enter password")
        setupLoginButton()
    }
    
    func setupAvatarUpload() {
        view.addSubview(avatar)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.image = UIImage(named: "avatar")
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupInputs() {
        view.addSubview(inputStacks)
        inputStacks.translatesAutoresizingMaskIntoConstraints = false
        inputStacks.axis = .vertical
        inputStacks.spacing = 13
        
        NSLayoutConstraint.activate([
            inputStacks.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 22),
            inputStacks.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            inputStacks.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
        ])
    }
    
    func configureInput(textField: PaddedTextField, labelText: String, placeholder: String) {
        let stack = UIStackView()
        let label = UILabel()
        
        inputStacks.addArrangedSubview(stack)
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(textField)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        
        label.configureCustomLabel(text: labelText, textColor: .white, fontName: "Sen-Regular", fontSize: 16)
        
        textField.configureCustomTextField(placeholder: placeholder)
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        
        loginButton.configureCustomButton(bgColor: .secondaryViolet, btnTitle: "Login", color: .white, fontName: "Sen-Medium", fonSize: 14)
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
        
        loginButton.addAction(UIAction(handler: { [weak self] action in
            
            
            print("124")
            if self?.passwordTxtField.text == self?.confirmPasswdTxtField.text {
                print("true")
                print("tapped true")

                do {
                    try KeyChainVC.shared.save(service: "quizapp", account: self?.userNameTxtField.text ?? "", password: self?.passwordTxtField.text?.data(using: .utf8) ?? Data())
                } catch {
                    print(error.localizedDescription)
                }
//                
                
                
                
            } else {
                self?.errorModal(text: "The passwords do not match")
            }
        }), for: .touchUpInside)
    }
    
    
    func errorModal(text: String) {
        let alert = UIAlertController(title: "OoOps...", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
