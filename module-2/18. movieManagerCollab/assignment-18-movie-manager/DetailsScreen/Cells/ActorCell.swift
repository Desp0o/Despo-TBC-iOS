
//
//  CollectionViewCell.swift
//  assignment-18-movie-manager
//
//  Created by Giorgi on 26.10.24.
//

import UIKit
 
final class ActorCell: UICollectionViewCell {
    var stack = UIStackView()
    var actorName = UILabel()
    var actorAvatar: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        setUpStack()
        setUpImg()
        setUpName()
    }
    
    private func setUpStack() {
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        
        stack.axis = .vertical
        stack.spacing = 8
    }
    
    private func setUpImg() {
        stack.addArrangedSubview(actorAvatar)
        actorAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actorAvatar.heightAnchor.constraint(equalToConstant: 72),
            actorAvatar.widthAnchor.constraint(equalToConstant: 72)
        ])
    }
    
    private func setUpName() {
        stack.addArrangedSubview(actorName)
        actorName.translatesAutoresizingMaskIntoConstraints = false
        
        actorName.font = UIFont(name: "Mulish-Regular", size: 12)
    }
}

