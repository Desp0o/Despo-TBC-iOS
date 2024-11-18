//
//  ViewController.swift
//  25. Animations
//
//  Created by Despo on 15.11.24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    private let startButton = UIButton()
    private let stack = UIStackView()
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
        
        setuBG()
        setupStartButton()
    }
    
    func playAudio() {
        guard let audioFilePath = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        
        let audioURL = URL(fileURLWithPath: audioFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.numberOfLoops = -1 // უსასრულო ლუპისთვის
            audioPlayer?.play()
        } catch {
            print("Failed to initialize audio player: \(error.localizedDescription)")
        }
    }

    
    private func setuBG() {
        let bg = UIImageView()
        bg.image = UIImage(named: "bg1")
        bg.contentMode = .scaleAspectFill
        
        view.addSubview(bg)
        bg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bg.topAnchor.constraint(equalTo: view.topAnchor),
            bg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bg.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupStartButton() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .systemYellow
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 120),
            startButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        startButton.addAction(UIAction(handler: {[weak self] _ in
            self?.playAudio()
            self?.setupLivesStack()
            self?.setupBanana()
            self?.setupMonkey()
            self?.setupBomb()
            self?.setupScoreLabel()
            self?.animateBanana()
            self?.animateBomb()
            self?.startButton.isHidden = true
        }), for: .touchUpInside)
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
        stack.arrangedSubviews.forEach { $0.removeFromSuperview() }
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
        case 20...:
            bananaInterval = 0.5
        case 15..<20:
            bananaInterval = 0.8
        case 10..<15:
            bananaInterval = 1.5
        case 5..<10:
            bananaInterval = 1.8
        default:
            bananaInterval = 2.0
        }
    }
    
    private func setupBanana() {
        let bananaSize: CGFloat = 50
        let bananaX = (view.frame.width - bananaSize) / 2
        let bananaY: CGFloat = -bananaSize
        
        banana.frame = CGRect(x: bananaX, y: bananaY, width: bananaSize, height: bananaSize)
        banana.image = UIImage(named: "banana")
        banana.contentMode = .scaleAspectFit
        
        view.addSubview(banana)
    }

    
    private func animateBanana() {
        setupBananaPosition()
        
        UIView.animate(withDuration: bananaInterval, delay: 0, options: [.curveLinear, .allowUserInteraction], animations: {[weak self] in
            self?.banana.frame.origin.y = (self?.view.bounds.height ?? 0) + 50
        }) {[weak self] completed in
            if completed {
                self?.animateBanana()
            }
        }
        
        collisionDetected = false
        displayLink = CADisplayLink(target: self, selector: #selector(checkForCollision))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    private func setupBananaPosition() {
        let randomX = CGFloat.random(in: 0...(view.bounds.width - 50))
        banana.frame.origin = CGPoint(x: randomX, y: 100)
    }
    
    
    private func setupBomb() {
        let bombSize: CGFloat = 50
        let bombX = (view.frame.width - bombSize) / 2
        let bombY: CGFloat = -bombSize
        
        bomb.frame = CGRect(x: bombX, y: bombY, width: bombSize, height: bombSize)
        bomb.image = UIImage(named: "bomb")
        bomb.contentMode = .scaleAspectFit
        
        view.addSubview(bomb)
    }

    
    private func animateBomb() {
        setupBombPosition()
        
        UIView.animate(withDuration: 1.5, delay: 0.2, options: [.curveLinear, .allowUserInteraction], animations: {[weak self] in
            self?.bomb.frame.origin.y = (self?.view.bounds.height ?? 0) + 30
        }) {[weak self] completed in
            if completed {
                self?.animateBomb()
            }
        }
        
        bombCollisionDetected = false
        bombDisplayLink = CADisplayLink(target: self, selector: #selector(checkBombCollision))
        bombDisplayLink?.add(to: .main, forMode: .common)
    }
    
    private func setupBombPosition() {
        let randomX = CGFloat.random(in: 0...(view.bounds.width - 30))
        bomb.frame.origin = CGPoint(x: randomX, y: 60)
    }
    
    private func setupMonkey() {
        view.addSubview(monkey)
        monkey.image = UIImage(named: "monkey")
        monkey.contentMode = .scaleAspectFit
        monkey.isUserInteractionEnabled = true
        
        monkey.frame = CGRect(x: view.center.x - 50, y: view.bounds.height - 150, width: 150, height: 150)
        
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {[weak self] in
                    self?.collisionDetected = false
                    self?.animateBanana()
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
                
                UIView.animate(withDuration: 0.1, animations: {[weak self] in
                    self?.monkey.alpha = 0
                }) {[weak self] _ in
                    UIView.animate(withDuration: 0.1) {
                        self?.monkey.alpha = 1
                    }
                }
                
                if livesArray.count >= 0 {
                    UIView.animate(withDuration: 0.3, animations: {[weak self] in
                        self?.livesArray.first?.alpha = 0
                    }) {[weak self] _ in
                        self?.livesArray.removeFirst()
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {[weak self] in
                    self?.bombCollisionDetected = false
                    if self?.livesArray.count ?? 0 == 0 {
                        self?.errorModal()
                        self?.bomb.layer.removeAllAnimations()
                        self?.banana.layer.removeAllAnimations()
                    }else {
                        self?.animateBomb()
                    }
                }
            }
        }
    }
    
    private func errorModal() {
        let alert = UIAlertController(title: "Loser, loser, soggy snoozer!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {[weak self] _ in
            self?.restartGame()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func restartGame() {
        monkey.frame.origin = CGPoint(x: view.bounds.midX - monkey.frame.width / 2, y: view.bounds.height - monkey.frame.height - 50)

        animateBanana()
        animateBomb()
        setupLivesStack()
        score = 0
    }
}

