//
//  ViewController.swift
//  25. Animations
//
//  Created by Despo on 15.11.24.
//

import UIKit

class ViewController: UIViewController {
    let stack = UIStackView()
    private let banana = UIImageView()
    private let monkey = UIImageView()
    private let bomb = UIImageView()
    private let scoreLabel = UILabel()
    private var displayLink: CADisplayLink?
    private var bombDisplayLink: CADisplayLink?
    private var bombCollisionDetected = false
    private var collisionDetected = false
    private var livesArray: [UIImageView] = []
    private var bananaInterval = 2.0
    private var score = 0 {
        didSet {
            self.scoreLabel.text = "Score: \(self.score)"
            scoreDidChange()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLivesStack()
        setupBanana()
        setupMonkey()
        setupBomb()
        setupScoreLabel()
        animateBanana()
        animateBomb()
    }
    
    private func setupLivesStack() {
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        updateLive()
    }
    
    private func updateLive() {
        for _ in 0..<3 {
            let live = UIImageView()
            
            live.image = UIImage(named: "banana")
            
            NSLayoutConstraint.activate([
                live.widthAnchor.constraint(equalToConstant: 25),
                live.heightAnchor.constraint(equalTo: live.widthAnchor, multiplier: 1)
                
            ])
            
            livesArray.append(live)
        }
        
        livesArray.forEach { live in
            stack.addArrangedSubview(live)
        }
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
        
        switch score {
        case 40...:
            bananaInterval = 0.5
        case 30..<40:
            bananaInterval = 0.8
        case 20..<30:
            bananaInterval = 1.5
        case 10..<20:
            bananaInterval = 1.8
        default:
            bananaInterval = 2.0
        }
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
        
        UIView.animate(withDuration: bananaInterval, delay: 0, options: [.curveLinear, .allowUserInteraction], animations: {
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
    
    
    private func setupBomb() {
        view.addSubview(bomb)
        
        bomb.translatesAutoresizingMaskIntoConstraints = false
        bomb.image = UIImage(named: "bomb")
        bomb.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            bomb.widthAnchor.constraint(equalToConstant: 30),
            bomb.heightAnchor.constraint(equalToConstant: 30),
            bomb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bomb.topAnchor.constraint(equalTo: view.topAnchor, constant: -30)
        ])
    }
    
    private func animateBomb() {
        setupBombPosition()
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear, .allowUserInteraction], animations: {
            self.bomb.frame.origin.y = self.view.bounds.height + 30
        }) { completed in
            if completed {
                self.animateBomb()
            }
        }
        
        bombCollisionDetected = false
        bombDisplayLink = CADisplayLink(target: self, selector: #selector(checkBombCollision))
        bombDisplayLink?.add(to: .main, forMode: .common)
    }
    
    private func setupBombPosition() {
        let randomX = CGFloat.random(in: 0...(view.bounds.width - 30))
        bomb.frame.origin = CGPoint(x: randomX, y: 30)
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
    
    @objc private func checkBombCollision() {
        guard let bombPresentationLayer = bomb.layer.presentation(),
              let monkeyPresentationLayer = monkey.layer.presentation() else {
            return
        }
        
        if bombPresentationLayer.frame.intersects(monkeyPresentationLayer.frame) {
            if !bombCollisionDetected {
                bombCollisionDetected = true
                bomb.layer.removeAllAnimations()
                bombDisplayLink?.invalidate()
                bombDisplayLink = nil
                
                if let lastLife = livesArray.first {
                    UIView.animate(withDuration: 0.3, animations: {
                        lastLife.alpha = 0
                    }) { _ in
                        lastLife.removeFromSuperview()
                        self.livesArray.removeFirst()
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.bombCollisionDetected = false
                    if self.livesArray.isEmpty {
                        self.bomb.layer.removeAllAnimations()
                        self.banana.layer.removeAllAnimations()
                    }else {
                        self.animateBomb()
                    }
                }
            }
        }
    }
}

