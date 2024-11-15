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
    private let scoreLabel = UILabel()
    private var initialCenter: CGPoint = .zero
    private var displayLink: CADisplayLink?
    private var collisionDetected = false
    private var score = 0 {
        didSet {
            scoreDidChange()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupBanana()
        setupMonkey()
        setupScoreLabel()
        animateBanana()
    }
    
    private func setupScoreLabel() {
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textColor = .systemYellow
        scoreLabel.text = "Score: \(score)"
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func scoreDidChange() {
        self.scoreLabel.text = "Score: \(self.score)"
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
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear, .allowUserInteraction, .allowAnimatedContent], animations: {
            self.banana.frame.origin.y = self.view.bounds.height + 50
        }) { completed in
            if completed {
                self.animateBanana()
            }
        }
        
        collisionDetected = false
        displayLink = CADisplayLink(target: self, selector: #selector(checkForCollision))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    private func setupBananaPosition() {
        let randomX = CGFloat.random(in: 0...(view.bounds.width - 50))
        banana.frame.origin = CGPoint(x: randomX, y: 50)
    }
    
    private func setupMonkey() {
        view.addSubview(monkey)
        monkey.image = UIImage(named: "monkey")
        monkey.contentMode = .scaleAspectFit
        monkey.isUserInteractionEnabled = true
        
        monkey.frame = CGRect(x: view.center.x - 50, y: view.bounds.height - 150, width: 100, height: 100)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        monkey.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        var newCenter = CGPoint(x: monkey.center.x + translation.x, y: monkey.center.y + translation.y)
        
        let halfWidth = monkey.bounds.width / 2
        let halfHeight = monkey.bounds.height / 2
        
        newCenter.x = max(halfWidth, min(view.bounds.width - halfWidth, newCenter.x))
        newCenter.y = max(halfHeight, min(view.bounds.height - halfHeight, newCenter.y))
        
        monkey.center = newCenter
        gesture.setTranslation(.zero, in: self.view)
        
    }
    
    @objc private func checkForCollision() {
        guard let bananaPresentationLayer = banana.layer.presentation(),
              let monkeyPresentationLayer = monkey.layer.presentation() else {
            return
        }
        
        if bananaPresentationLayer.frame.intersects(monkeyPresentationLayer.frame) {
            if !collisionDetected {
                collisionDetected = true
                banana.layer.removeAllAnimations()
                displayLink?.invalidate()
                displayLink = nil
                
                score += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.collisionDetected = false
                    self.animateBanana()
                }
            }
        } else {
            collisionDetected = false
        }
    }
    
}

