//
//  PlanetCell.swift
//  17. UITableView
//
//  Created by Despo on 18.10.24.
//
import UIKit

final class PlanetCell: UITableViewCell {
    private let cellStack = UIStackView()
    private let infoStack = UIStackView()
    private var planetImg = UIImageView()
    private var planetTitle = UILabel()
    private var planetArea = UILabel()
    private var arrowIocn = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupUI() {
        setupMainStack()
        setupImage()
        setupInfoStack()
        setupPlanetInfo()
        setupArrowIcon()
    }
    
    private func setupImage() {
        NSLayoutConstraint.activate([
            planetImg.widthAnchor.constraint(equalToConstant: 100),
            planetImg.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setupMainStack() {
        contentView.addSubview(cellStack)
        cellStack.addArrangedSubview(planetImg)
        
        cellStack.axis = .horizontal
        cellStack.alignment = .center
        cellStack.spacing = 36
        
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
            infoStack.topAnchor.constraint(equalTo: cellStack.topAnchor),
            infoStack.bottomAnchor.constraint(equalTo: cellStack.bottomAnchor)
        ])
        
    }
    
    private func setupPlanetInfo() {
        planetTitle.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        
        planetArea.font = UIFont.systemFont(ofSize: 18)
    }
    
    private func setupArrowIcon() {
        cellStack.addArrangedSubview(arrowIocn)
        
        arrowIocn.image = UIImage(named: "arrowIcon")
    }
    
    func setupPlanetCell(planetImage: UIImage, planetTitle: String, planetArea: String) {
        self.planetImg.image = planetImage
        self.planetTitle.text = planetTitle
        self.planetArea.text = planetArea
    }
}
