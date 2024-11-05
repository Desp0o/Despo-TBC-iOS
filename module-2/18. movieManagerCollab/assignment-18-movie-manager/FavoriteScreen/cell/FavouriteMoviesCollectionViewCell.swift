//
//  FavouriteMoviesCollectionViewCell.swift
//  assignment-18-movie-manager
//
//  Created by Cotne Chubinidze on 25.10.24.
//

import UIKit
import Foundation

class FavouriteMoviesCollectionViewCell: UICollectionViewCell {
    private let posterView = UIImageView()
    private let titleLabel = UILabel()
    private let imdbLabel = UILabel()
    private let starImageView = UIImageView()
    private let movieImgContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.4
        container.layer.shadowOffset = CGSize(width: 0, height: 5)
        container.layer.shadowRadius = 5
        container.layer.masksToBounds = false
        return container
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        titleLabel.text = nil
        imdbLabel.text = nil
        starImageView.image = UIImage(named: "ratingStar")
        contentView.frame = .zero
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        contentMode = .scaleAspectFit
        setupStarImageView()
        setupImdbLabel()
        setupTitleLabel()
        setupPosterView()
    }
    private func setupImdbLabel() {
        imdbLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imdbLabel)
        
        imdbLabel.font = UIFont(name: "Mulish-Regular", size: 12)
        imdbLabel.textColor = .secondarytext
        imdbLabel.textAlignment = .left
        imdbLabel.sizeToFit()
        imdbLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            imdbLabel.leftAnchor.constraint(equalTo: starImageView.rightAnchor, constant: 5),
            imdbLabel.heightAnchor.constraint(equalToConstant: 15),
            imdbLabel.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor)
        ])
        
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        titleLabel.font = UIFont(name: "Mulish-Bold", size: 14)
        titleLabel.textColor = .primaryText
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 120),
            titleLabel.bottomAnchor.constraint(equalTo: imdbLabel.topAnchor, constant: -5)
        ])
    }
    
    private func setupPosterView() {
        contentView.addSubview(movieImgContainer)
        movieImgContainer.addSubview(posterView)
        
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.contentMode = .scaleAspectFill
        posterView.layer.cornerRadius = 10
        posterView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            movieImgContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImgContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImgContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImgContainer.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8),
            
            posterView.topAnchor.constraint(equalTo: movieImgContainer.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: movieImgContainer.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: movieImgContainer.trailingAnchor),
            posterView.bottomAnchor.constraint(equalTo: movieImgContainer.bottomAnchor)
        ])
        
        posterView.layer.cornerRadius = 10
    }
    
    private func setupStarImageView() {
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(starImageView)
        
        starImageView.image = UIImage(named: "ratingStar")
        
        NSLayoutConstraint.activate([
            starImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            starImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureCell(with movie: Movie_Model?) {
        if let movie = movie {
            posterView.image = UIImage(named: movie.poster)
            titleLabel.text = movie.title
            imdbLabel.text = "\(String(movie.imdb))/10 IMDb"
        }
    }
}
