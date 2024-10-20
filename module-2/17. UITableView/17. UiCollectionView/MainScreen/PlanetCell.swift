//
//  PlanetCell.swift
//  17. UiCollectionView
//
//  Created by Despo on 19.10.24.
//

import UIKit

protocol makeFavFromCellDelegate: AnyObject {
    func savePlanet(index: Int)
}

final class PlanetCell: UICollectionViewCell {
    weak var delegate: makeFavFromCellDelegate?
    
    private let planetImg = UIImageView()
    private let stackView = UIStackView()
    private let favouriteButton = UIButton()
    private let titleLbl = UILabel()
    private let areaLbl = UILabel()
    private let planetinfoStack = UIStackView()
    
    private var isFaved = false
    private var index: Int?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupImage()
        setupTitleAndfavouriteButton()
    }
    
    private func setupImage() {
        contentView.addSubview(planetImg)
        planetImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            planetImg.widthAnchor.constraint(equalToConstant: 100),
            planetImg.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupTitleAndfavouriteButton() {
        contentView.addSubview(planetinfoStack)
        
        planetinfoStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            planetinfoStack.topAnchor.constraint(equalTo: planetImg.bottomAnchor, constant: 10),
            planetinfoStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            planetinfoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
        ])
        
        setupStack()
    }
    
    private func setupStack() {
        planetinfoStack.addArrangedSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: planetinfoStack.topAnchor, constant: 0),
            stackView.centerXAnchor.constraint(equalTo: planetinfoStack.centerXAnchor)
        ])
        
        setupTitleLabel()
        setupFavouriteIcon()
        setupAreaLabel()
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.font = UIFont.boldSystemFont(ofSize: 32)
        titleLbl.textColor = .white
    }
    
    private func setupFavouriteIcon() {
        stackView.addArrangedSubview(favouriteButton)
        stackView.bringSubviewToFront(favouriteButton)
        
        favouriteButton.isUserInteractionEnabled = true
        favouriteButton.configureButtonIcon(with: isFaved ? "starActive" : "starInactive", size: 15)

        favouriteButton.addAction(UIAction(handler: { action in
            self.updatePlanetView()
        }), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            favouriteButton.leftAnchor.constraint(equalTo: titleLbl.rightAnchor, constant: 10)
        ])
    }
    
    private func setupAreaLabel() {
        planetinfoStack.addSubview(areaLbl)
        
        areaLbl.font = UIFont.boldSystemFont(ofSize: 18)
        areaLbl.textColor = UIColor.white
        
        areaLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            areaLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            areaLbl.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8)
        ])
    }
    
    private func updatePlanetView() {
        guard let index = index else { return }
        delegate?.savePlanet(index: index)
    }
    
    func configurePlanetCell(planetImg: UIImage, titleLbl: String, areaLbl: String, isFaved: Bool, index: Int) {
        self.planetImg.image = planetImg
        self.titleLbl.text = titleLbl
        self.areaLbl.text = areaLbl
        self.isFaved = isFaved
        self.index = index
        
        favouriteButton.setImage(UIImage(named: isFaved ? "starActive" : "starInactive"), for: .normal)
    }
}


