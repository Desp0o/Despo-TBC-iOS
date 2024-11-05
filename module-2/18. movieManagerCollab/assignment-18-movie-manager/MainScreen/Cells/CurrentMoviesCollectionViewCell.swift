//
//  CurrentMoviesCollectionViewCell.swift
//  assignment-18-movie-manager
//
//  Created by Giorgi Amiranashvili on 26.10.24.
//

import UIKit

final class CurrentMoviesCollectionViewCell: UICollectionViewCell {
    
    var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
      let movieImgContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.3
        container.layer.shadowOffset = CGSize(width: 0, height: 5)
        container.layer.shadowRadius = 6
        return container
    }()
    
    var movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Mulish-Bold", size: 14)
        label.numberOfLines = 2
        label.textColor = .darkBlue
        
        return label
    }()
    
    var movieRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        label.textColor = .secondarytext
        return label
    }()
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        configureMovieImage()
        configureMovieNameLabel()
        configureMovieRatingLabel()
        configureRatingIcon()
    }
    
    func configureMovieImage() {
        addSubview(movieImgContainer)
        
        movieImgContainer.addSubview(movieImage)

        movieImage.clipsToBounds = true
        movieImage.layer.cornerRadius = 8
        movieImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            movieImgContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImgContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieImgContainer.widthAnchor.constraint(equalToConstant: 143),
            movieImgContainer.heightAnchor.constraint(equalToConstant: 212),
            
            
            movieImage.topAnchor.constraint(equalTo: movieImgContainer.topAnchor, constant: 0),
            movieImage.leftAnchor.constraint(equalTo: movieImgContainer.leftAnchor, constant: 0),
            movieImage.widthAnchor.constraint(equalToConstant: 143),
            movieImage.heightAnchor.constraint(equalToConstant: 212)
        ])
        
    }
    
    func configureMovieNameLabel() {
        addSubview(movieNameLabel)
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 12),
            movieNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            movieNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 139)
        ])
    }
    
    func configureMovieRatingLabel() {
        addSubview(movieRatingLabel)
        
        NSLayoutConstraint.activate([
            movieRatingLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 8),
            movieRatingLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 22),
            movieRatingLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 155)
        ])
    }
    
    func configureRatingIcon() {
        addSubview(icon)
        icon.image = .ratingStar
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: movieRatingLabel.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: 12),
            icon.widthAnchor.constraint(equalToConstant: 12),
            icon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
}
