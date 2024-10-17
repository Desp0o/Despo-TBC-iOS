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
    private let planetImg = UIImageView()
    private let planetTitle = UILabel()
    private let infoText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    private func setupImage() {
        planetImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImg.widthAnchor.constraint(equalToConstant: 100),
            planetImg.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupMainStack() {
        contentView.addSubview(cellStack)
        cellStack.addArrangedSubview(planetImg)
        
        cellStack.axis = .horizontal
        cellStack.spacing = 36
        cellStack.alignment = .leading
        
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cellStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cellStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cellStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupInfoStack() {
        cellStack.addArrangedSubview(infoStack)
        infoStack.addArrangedSubview(planetTitle)
        infoStack.addArrangedSubview(infoText)
        
        infoStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPlanetCell(planetImage: UIImage, planetTitle: String, planetInfo: String) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
