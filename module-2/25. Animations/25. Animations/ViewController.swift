//
//  ViewController.swift
//  25. Animations
//
//  Created by Despo on 15.11.24.
//

import UIKit

class ViewController: UIViewController {
    let banana = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupBanana()
        animateBanana()
    }
    
    private func setupBanana() {
        view.addSubview(banana)
        
        banana.translatesAutoresizingMaskIntoConstraints = false
        banana.image = UIImage(named: "banana")
        banana.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            banana.widthAnchor.constraint(equalToConstant: 50),
            banana.heightAnchor.constraint(equalToConstant: 50),
            banana.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            banana.topAnchor.constraint(equalTo: view.topAnchor, constant: -50)
        ])
    }
    
    private func animateBanana() {
            setupBananaPosition()
            
            UIView.animate(withDuration: 2.0,
                          delay: 0,
                          options: .curveLinear,
                          animations: {
                self.banana.frame.origin.y = self.view.bounds.height + 50
            }) { completed in
                if completed {
                    self.animateBanana()
                }
            }
        }
    
    func setupBananaPosition(){
        let randomX = CGFloat.random(in: 0...(view.bounds.width - 20))
        banana.frame.origin = CGPoint(x: randomX, y: 50)
    }
}

