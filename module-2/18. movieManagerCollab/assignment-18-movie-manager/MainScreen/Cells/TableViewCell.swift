//
//  TableViewCell.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

final class TableViewCell: UITableViewCell, UICollectionViewDataSource {
    private let poster = UIImageView()
    private let title = UILabel()
    private let imdb = UILabel()
    private let duration = UILabel()
    private var genres: [String] = []
    private let cellStack = UIStackView()
    private let movieInfoStack = UIStackView()
    
    private let collectionView: UICollectionView = {
        let collection: UICollectionView
        let collectionLayout = UICollectionViewFlowLayout()
        
        collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionLayout.minimumLineSpacing = 8
        collectionLayout.scrollDirection = .horizontal
        
        collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        setupCellMainStack()
        setupPoster()
        setupMovieInfoStack()
    }
    
    private func setupCellMainStack() {
        contentView.addSubview(cellStack)
        
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        cellStack.isLayoutMarginsRelativeArrangement = true
        cellStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    private func setupPoster() {
        cellStack.addArrangedSubview(poster)
        cellStack.spacing = 16
        cellStack.distribution = .fillProportionally
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.layer.masksToBounds = true
        poster.layer.cornerRadius = 8
        poster.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            poster.widthAnchor.constraint(equalToConstant: 85),
            poster.heightAnchor.constraint(equalToConstant: 128)
        ])
    }
    
    private func setupTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 2
        title.lineBreakMode = .byWordWrapping
        
        movieInfoStack.addArrangedSubview(title)
        
        NSLayoutConstraint.activate([
            title.widthAnchor.constraint(lessThanOrEqualToConstant: 117),
            title.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
        ])
    }
    
    private func setupMovieInfoStack() {
        cellStack.addArrangedSubview(movieInfoStack)
        
        movieInfoStack.translatesAutoresizingMaskIntoConstraints = false
        movieInfoStack.isLayoutMarginsRelativeArrangement = true
        movieInfoStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        
        movieInfoStack.axis = .vertical
        movieInfoStack.spacing = 8
        movieInfoStack.alignment = .leading
        movieInfoStack.distribution = .fill
        
        setupTitle()
        
        let imdbStack = generateStackWithIcon(iconName: "ratingStar", uiLabel: imdb)
        movieInfoStack.addArrangedSubview(imdbStack)
        
        setupCollectionView()
        
        let durationStack = generateStackWithIcon(iconName: "durationIcon", uiLabel: duration)
        movieInfoStack.addArrangedSubview(durationStack)
        durationStack.translatesAutoresizingMaskIntoConstraints = false
    }

    private func generateStackWithIcon(iconName: String, uiLabel: UILabel) -> UIStackView {
        let stack = UIStackView()
        let icon = UIImageView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: iconName)
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 12),
            icon.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(uiLabel)
        
        return stack
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(TableColleCtionCell.self, forCellWithReuseIdentifier: "TableColleCtionCell")
        collectionView.showsHorizontalScrollIndicator = false
        movieInfoStack.addArrangedSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: movieInfoStack.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: movieInfoStack.trailingAnchor),
        ])
    }
    
    func configureTbaleViewCell(currentMovie: Movie_Model) {
        self.poster.image = UIImage(named: currentMovie.poster)
        self.title.configureMovieTitle(with: currentMovie.title)
        self.imdb.configureSeocndaryText(with: "\(currentMovie.imdb)/10 IMDb")
        self.duration.configureSeocndaryText(with: currentMovie.duration)
        self.genres = currentMovie.genres
        
        collectionView.reloadData()
    }
}

extension TableViewCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableColleCtionCell", for: indexPath) as? TableColleCtionCell
        
        let currentGenre = genres[indexPath.row]
        
        cell?.configureCell(genre: currentGenre)
        
        return cell ?? UICollectionViewCell()
    }
}
