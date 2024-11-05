//
//  GenreCell.swift
//  assignment-18-movie-manager
//
//  Created by nino on 10/25/24.
//
import UIKit
 
final class GenreCell: UICollectionViewCell {
    var genreLable = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        setUpGenreLable()
    }
    
    private func setUpGenreLable() {
        contentView.addSubview(genreLable)
        
        contentView.backgroundColor = .purpleSecondary
        contentView.layer.cornerRadius = 10
        genreLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            genreLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            genreLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            genreLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        genreLable.font = UIFont(name: "Mulish-Regular", size: 8)
        genreLable.textColor = .purplePrimary
        genreLable.textAlignment = .center
    }
}
