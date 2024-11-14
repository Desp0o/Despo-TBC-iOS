//
//  ViewController.swift
//  25. Animations
//
//  Created by Despo on 15.11.24.
//

import UIKit

class ViewController: UIViewController {
    private let banana = UIImageView()
    private let monkey = UIImageView()
    private var initialCenter: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupBanana()
        animateBanana()
        setupMonkey()
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
    
    private func setupBananaPosition(){
        let randomX = CGFloat.random(in: 0...(view.bounds.width - 50))
        banana.frame.origin = CGPoint(x: randomX, y: 50)
    }
    
    private func setupMonkey() {
        view.addSubview(monkey)
        monkey.translatesAutoresizingMaskIntoConstraints = false
        monkey.image = UIImage(named: "monkey")
        monkey.contentMode = .scaleAspectFit
        monkey.isUserInteractionEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        monkey.addGestureRecognizer(panGesture)
        
        NSLayoutConstraint.activate([
            monkey.widthAnchor.constraint(equalToConstant: 100),
            monkey.heightAnchor.constraint(equalToConstant: 100),
            monkey.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            monkey.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
        case .began:
            initialCenter = monkey.center
            
        case .changed:
            var newCenter = CGPoint(
                x: initialCenter.x + translation.x,
                y: initialCenter.y + translation.y
            )
            
            let halfWidth = monkey.bounds.width / 2
            newCenter.x = min(max(newCenter.x, halfWidth), view.bounds.width - halfWidth)
            
            let halfHeight = monkey.bounds.height / 2
            newCenter.y = min(max(newCenter.y, halfHeight), view.bounds.height - halfHeight)
            
            monkey.center = newCenter
            
        case .ended:
            UIView.animate(withDuration: 0.3) { }
            
        default:
            break
        }
    }
}

