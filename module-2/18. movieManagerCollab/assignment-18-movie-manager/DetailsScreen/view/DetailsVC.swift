//
//  DetailsVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

final class DetailsVC: UIViewController {
    private let navigationView = UIStackView()
    private var backDropImage = UIImageView()
    private let movieDetailsView = UIView()
    private let backButton = UIButton()
    private let viewForTitleFavRanking = UIView()
    private let titleLable = UILabel()
    private let saveButton = UIButton()
    private let viewForIMDB = UIView()
    private let starSign = UIImageView()
    private let imbdLable = UILabel()
    private let stackViewForDetails = UIStackView()
    private let viewForDescription = UIView()
    private let descriptionLable = UILabel()
    private var descriptionTextLable = UILabel()
    private var castLable = UILabel()
    
    var collecrionViewForGenre: UICollectionView = {
        let collection: UICollectionView
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumLineSpacing = 8
        collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        
        return collection
    }()
    
    var collecrionViewForActors: UICollectionView = {
        let collection: UICollectionView
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumLineSpacing = 8
        collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private var movie: Movie_Model
    private var movieViewModel = Movie_ViewModel()
    
    init(backDropImage: UIImageView = UIImageView(), descriptionTextLable: UILabel = UILabel(), castLable: UILabel = UILabel(),  movie: Movie_Model) {
        self.backDropImage = backDropImage
        self.descriptionTextLable = descriptionTextLable
        self.castLable = castLable
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupCustomNavigation()
        setUpbackDropImageView()
        setUpmovieDetailsView()
        setUpBackButton()
        setUpviewForTitleFavRanking()
        setUpTitleLable()
        setUpSaveButton()
        setUpViewForIMDB()
        setUpImageView()
        setUpimdbLable()
        setUpcollecrionViewForGenre()
        setUpstackViewForDetails()
        setUpViewForDescription()
        setUpDescriprionLable()
        setUpDesctiptionLableText()
        setUpCastTitle()
        setUpCastCollectionView()
    }
    
    private func setUpbackDropImageView() {
        view.addSubview(backDropImage)
        backDropImage.translatesAutoresizingMaskIntoConstraints = false
        backDropImage.contentMode = .scaleAspectFill
        view.bringSubviewToFront(backButton)

        
        NSLayoutConstraint.activate([
            backDropImage.topAnchor.constraint(equalTo: view.topAnchor),
            backDropImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backDropImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backDropImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        backDropImage.image = UIImage(named: movie.backDrop)
    }
    
    private func setUpmovieDetailsView() {
        view.addSubview(movieDetailsView)
        movieDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieDetailsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            movieDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            movieDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            movieDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        movieDetailsView.backgroundColor = .white
        movieDetailsView.layer.cornerRadius = 12
        movieDetailsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]    }
    
    private func setUpBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor, multiplier: 1.0)
        ])
        
        backButton.imageView?.contentMode = .scaleToFill
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        
        backButton.addAction(UIAction(handler: { [weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    private func setUpviewForTitleFavRanking() {
        movieDetailsView.addSubview(viewForTitleFavRanking)
        viewForTitleFavRanking.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForTitleFavRanking.topAnchor.constraint(equalTo: movieDetailsView.topAnchor, constant: 24),
            viewForTitleFavRanking.leftAnchor.constraint(equalTo: movieDetailsView.leftAnchor, constant: 24),
            viewForTitleFavRanking.rightAnchor.constraint(equalTo: movieDetailsView.rightAnchor, constant: -24)
        ])
    }
    
    private func setUpTitleLable() {
        viewForTitleFavRanking.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: viewForTitleFavRanking.topAnchor),
            titleLable.leftAnchor.constraint(equalTo: viewForTitleFavRanking.leftAnchor),
            titleLable.widthAnchor.constraint(lessThanOrEqualToConstant: 198)
        ])

        titleLable.text = movie.title
        titleLable.font = UIFont(name: "Mulish-Bold", size: 25)
        titleLable.numberOfLines = 0
        titleLable.textColor = .black
    }
    
    private func setUpSaveButton() {
        viewForTitleFavRanking.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        let saveImageFav = UIImage(named: "BookmarkActive")?.withRenderingMode(.automatic)
        let saveImageNotFav = UIImage(named: "bookmarkInactive")?.withRenderingMode(.automatic)
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: viewForTitleFavRanking.topAnchor),
            saveButton.rightAnchor.constraint(equalTo: viewForTitleFavRanking.rightAnchor),
            saveButton.leftAnchor.constraint(equalTo: viewForTitleFavRanking.rightAnchor, constant: 105),
            saveButton.heightAnchor.constraint(equalToConstant: 24),
            saveButton.widthAnchor.constraint(equalTo: saveButton.heightAnchor, multiplier: 1.0)
        ])
        
        if movie.isFaved == true {
            saveButton.setImage(saveImageFav, for: .normal)
        } else {
            saveButton.setImage(saveImageNotFav, for: .normal)
        }
        
        saveButton.imageView?.tintColor = .black
        
        saveButton.addAction(UIAction(handler: { [weak self] movie in
            self?.movieViewModel.favouritesButtonTapped(movie: self!.movie)
            if self?.movie.isFaved == true {
                self?.saveButton.setImage(saveImageFav, for: .normal)
            } else {
                self?.saveButton.setImage(saveImageNotFav, for: .normal)
            }
        }), for: .touchUpInside)
    }
    
    private func setUpViewForIMDB() {
        viewForTitleFavRanking.addSubview(viewForIMDB)
        viewForIMDB.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForIMDB.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            viewForIMDB.bottomAnchor.constraint(equalTo: viewForTitleFavRanking.bottomAnchor),
            viewForIMDB.leftAnchor.constraint(equalTo: viewForTitleFavRanking.leftAnchor)
        ])
    }
    
    private func setUpImageView() {
        viewForIMDB.addSubview(starSign)
        starSign.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starSign.leftAnchor.constraint(equalTo: viewForIMDB.leftAnchor),
            starSign.centerYAnchor.constraint(equalTo: viewForIMDB.centerYAnchor),
            starSign.heightAnchor.constraint(equalToConstant: 12),
            starSign.widthAnchor.constraint(equalTo: starSign.heightAnchor, multiplier: 1.0)
        ])
        
        starSign.image = UIImage(named: "ratingStar")
    }
    
    private func setUpimdbLable() {
        viewForIMDB.addSubview(imbdLable)
        imbdLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imbdLable.leftAnchor.constraint(equalTo: starSign.rightAnchor, constant: 1.5),
            imbdLable.centerYAnchor.constraint(equalTo: viewForIMDB.centerYAnchor),
        ])
        
        imbdLable.text = "\(movie.imdb)/10 IMDb"
        imbdLable.font = UIFont(name: "Mulish-Regular", size: 12)
        imbdLable.textColor = .secondarytext
    }
    
    private func setUpcollecrionViewForGenre() {
        movieDetailsView.addSubview(collecrionViewForGenre)
        
        NSLayoutConstraint.activate([
            collecrionViewForGenre.topAnchor.constraint(equalTo: viewForTitleFavRanking.bottomAnchor, constant: 16),
            collecrionViewForGenre.leadingAnchor.constraint(equalTo: viewForTitleFavRanking.leadingAnchor),
            collecrionViewForGenre.trailingAnchor.constraint(equalTo: viewForTitleFavRanking.trailingAnchor),
            collecrionViewForGenre.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        collecrionViewForGenre.register(GenreCell.self, forCellWithReuseIdentifier: "GenreCell")
        collecrionViewForGenre.dataSource = self
    }
    
    private func setUpstackViewForDetails() {
        movieDetailsView.addSubview(stackViewForDetails)
        stackViewForDetails.translatesAutoresizingMaskIntoConstraints = false
        stackViewForDetails.axis = .horizontal
        stackViewForDetails.alignment = .fill
        stackViewForDetails.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            stackViewForDetails.topAnchor.constraint(equalTo: collecrionViewForGenre.bottomAnchor, constant: 16),
            stackViewForDetails.leadingAnchor.constraint(equalTo: viewForTitleFavRanking.leadingAnchor),
            stackViewForDetails.trailingAnchor.constraint(equalTo: viewForTitleFavRanking.trailingAnchor),
            stackViewForDetails.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        guard let headerFont = UIFont(name: "Mulish-Regular", size: 12) else { return }
        guard let valueFont = UIFont(name: "Mulish-Bold", size: 12) else { return }
        
        let lengthTitleLabel = createLabel(text: "Length", font: headerFont, textColor: .secondarytext)
        let lengthValueLabel = createLabel(text: movie.duration, font: valueFont, textColor: .black)
        let lengthStackView = createVerticalStackView(subviews: [lengthTitleLabel, lengthValueLabel])
        
        let languageTitleLabel = createLabel(text: "Language", font: headerFont, textColor: .secondarytext)
        let languageValueLabel = createLabel(text: movie.language, font: valueFont, textColor: .black)
        let languageStackView = createVerticalStackView(subviews: [languageTitleLabel, languageValueLabel])
        
        let ratingTitleLabel = createLabel(text: "Rating", font: headerFont, textColor: .secondarytext)
        let ratingValueLabel = createLabel(text: movie.rating, font: valueFont, textColor: .black)
        let ratingStackView = createVerticalStackView(subviews: [ratingTitleLabel, ratingValueLabel])
        
        stackViewForDetails.addArrangedSubview(lengthStackView)
        stackViewForDetails.addArrangedSubview(languageStackView)
        stackViewForDetails.addArrangedSubview(ratingStackView)
    }
    
    private func createLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        return label
    }

    private func createVerticalStackView(subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }
    
    private func setUpViewForDescription() {
        movieDetailsView.addSubview(viewForDescription)
        viewForDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForDescription.topAnchor.constraint(equalTo: stackViewForDetails.bottomAnchor, constant: 24),
            viewForDescription.leadingAnchor.constraint(equalTo: viewForTitleFavRanking.leadingAnchor),
            viewForDescription.trailingAnchor.constraint(equalTo: viewForTitleFavRanking.trailingAnchor),
        ])
    }
    
    private func setUpDescriprionLable() {
        viewForDescription.addSubview(descriptionLable)
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLable.topAnchor.constraint(equalTo: viewForDescription.topAnchor),
            descriptionLable.leftAnchor.constraint(equalTo: viewForDescription.leftAnchor)
        ])
        
        descriptionLable.text = "Description"
        descriptionLable.font = UIFont(name: "Merriweather-Black", size: 16)
    }
    
    private func setUpDesctiptionLableText() {
        viewForDescription.addSubview(descriptionTextLable)
        descriptionTextLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionTextLable.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 8),
            descriptionTextLable.leadingAnchor.constraint(equalTo: viewForTitleFavRanking.leadingAnchor),
            descriptionTextLable.trailingAnchor.constraint(equalTo: viewForTitleFavRanking.trailingAnchor),
        ])
        
        descriptionTextLable.text = movie.description
        descriptionTextLable.font = UIFont(name: "Mulish-Regular", size: 12)
        descriptionTextLable.numberOfLines = 0
        descriptionTextLable.textAlignment = .left
        descriptionTextLable.textColor = .secondarytext
    }
    
    private func setupCustomNavigation() {
        view.addSubview(navigationView)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.isLayoutMarginsRelativeArrangement = true
        navigationView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
    
    private func setUpCastTitle() {
        view.addSubview(castLable)
        castLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            castLable.topAnchor.constraint(equalTo: descriptionTextLable.bottomAnchor, constant: 24),
            castLable.leftAnchor.constraint(equalTo: viewForTitleFavRanking.leftAnchor)
        ])
        
        castLable.text = "Cast"
        castLable.font = UIFont(name: "Merriweather-Black", size: 16)
    }
    
    private func setUpCastCollectionView() {
        view.addSubview(collecrionViewForActors)
        
        NSLayoutConstraint.activate([
            collecrionViewForActors.topAnchor.constraint(equalTo: castLable.bottomAnchor, constant: 8),
            collecrionViewForActors.leadingAnchor.constraint(equalTo: viewForTitleFavRanking.leadingAnchor),
            collecrionViewForActors.trailingAnchor.constraint(equalTo: viewForTitleFavRanking.trailingAnchor),
            collecrionViewForActors.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        collecrionViewForActors.register(ActorCell.self, forCellWithReuseIdentifier: "ActorCell")
        collecrionViewForActors.dataSource = self
    }
}

extension DetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collecrionViewForGenre {
            movie.genres.count
        } else {
            movie.cast.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collecrionViewForGenre {
            let curGenre = movie.genres[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as? GenreCell
            
            cell?.genreLable.text = curGenre
            
            return cell ?? UICollectionViewCell()
        } else {
            let curActor = movie.cast[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorCell", for: indexPath) as? ActorCell
            
            cell?.actorName.text = curActor.name
            cell?.actorAvatar.image = UIImage(named: curActor.avatar) ?? UIImage()
            
            return cell ?? UICollectionViewCell()
        }
    }
}
