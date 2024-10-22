//
//  PlanetCell.swift
//  17. UITableView
//
//  Created by Despo on 18.10.24.
//
import UIKit

protocol UpdatePLanetStatus: AnyObject {
    func addPlanetFavourites(index: Int)
}

final class PlanetCell: UITableViewCell {
    weak var delegate: UpdatePLanetStatus?
    private let cellStack = UIStackView()
    private let infoStack = UIStackView()
    private var planetImg = UIImageView()
    private var planetTitle = UILabel()
    private var planetArea = UILabel()
    private var arrowIocn = UIImageView()
    private let favIcon = UIImageView()
    private var isFaved = false
    private var currentIndex: Int?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        
        setupMainStack()
        setupImage()
        setupInfoStack()
        setupPlanetInfo()
        setupArrowIcon()
        setupFavorite()
    }
    
    private func setupImage() {
        NSLayoutConstraint.activate([
            planetImg.widthAnchor.constraint(equalToConstant: 100),
            planetImg.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setupFavorite() {
        favIcon.image = UIImage(systemName: "star")
        contentView.addSubview(favIcon)
        contentView.bringSubviewToFront(favIcon)
        
        favIcon.tintColor = .gray
        favIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favIcon.trailingAnchor.constraint(equalTo: arrowIocn.leadingAnchor, constant: -20),
            favIcon.centerYAnchor.constraint(equalTo: infoStack.centerYAnchor),
            favIcon.heightAnchor.constraint(equalToConstant: 24),
            favIcon.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favIconTapped))
        favIcon.isUserInteractionEnabled = true
        favIcon.addGestureRecognizer(tapGesture)
    }
    
    @objc private func favIconTapped() {
        guard let index = currentIndex else  { return }
        self.delegate?.addPlanetFavourites(index: index)
    }
    
    private func setupMainStack() {
        contentView.addSubview(cellStack)
        cellStack.addArrangedSubview(planetImg)
        
        cellStack.axis = .horizontal
        cellStack.alignment = .center
        cellStack.spacing = 36
        
        cellStack.isLayoutMarginsRelativeArrangement = true
        cellStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cellStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupInfoStack() {
        cellStack.addArrangedSubview(infoStack)
        infoStack.addArrangedSubview(planetTitle)
        infoStack.addArrangedSubview(planetArea)
        
        infoStack.axis = .vertical
        infoStack.alignment = .top
        
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoStack.leftAnchor.constraint(equalTo: planetImg.rightAnchor, constant: 36),
        ])
        
        planetTitle.intrinsicContentSize = .init()
    }
    
    private func setupPlanetInfo() {
        planetTitle.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        
        planetArea.font = UIFont.systemFont(ofSize: 18)
    }
    
    private func setupArrowIcon() {
        cellStack.addArrangedSubview(arrowIocn)
        
        arrowIocn.image = UIImage(named: "arrowIcon")
    }
    
    func setupPlanetCell(planet: Planet, currentIndex: Int) {
        self.planetImg.image = UIImage(named: planet.image)
        self.planetTitle.text = planet.name
        self.planetArea.text = planet.area
        self.isFaved = planet.isFaved
        self.currentIndex = currentIndex
        
        favIcon.image = UIImage(systemName: isFaved ? "star.fill" : "star")
        favIcon.tintColor = isFaved ? .systemYellow : .gray
    }
}

