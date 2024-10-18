//
//  PlanetInfoVC.swift
//  17. UITableView
//
//  Created by Despo on 18.10.24.
//

import UIKit

final class PlanetDetailsVC: UIViewController {
    private let planet: Planet
    
    private let scrollView = UIScrollView()
    private let planetImageView = UIImageView()
    private let backButton = UIButton()
    private let titleLbl = UILabel()
    private let areaLbl = UILabel()
    private let tempLbl = UILabel()
    private let massLbl = UILabel()
    private let infoStack = UIStackView()
    
    init(planet: Planet) {
        self.planet = planet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgorundColor
        setupUI()
    }
    
    
    func setupUI(){
        setupScrollView()
        setupBackButton()
        setupTitleLabel()
        setupPlanetImageView()
        setupInfoStack()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBackButton() {
        scrollView.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setImage(UIImage(named: "arrowIcon"), for: .normal)
        backButton.transform = backButton.transform.rotated(by: .pi)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30)
        ])
        
        backButton.addAction(UIAction(handler: {[weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupTitleLabel() {
        scrollView.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        titleLbl.text = planet.name
        titleLbl.font = UIFont.boldSystemFont(ofSize: 36)
        titleLbl.textColor = primaryColor
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 23),
            titleLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func setupPlanetImageView() {
        scrollView.addSubview(planetImageView)
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        
        planetImageView.image = planet.image
        
        NSLayoutConstraint.activate([
            planetImageView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 86),
            planetImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            planetImageView.widthAnchor.constraint(equalToConstant: 280),
            planetImageView.heightAnchor.constraint(equalToConstant: 280)
        ])
        
    }
    
    private func setupInfoStack() {
        scrollView.addSubview(infoStack)
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        
        infoStack.axis = .vertical
        infoStack.alignment = .center
        infoStack.spacing = 16
        
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 112),
            infoStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            infoStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        setupPlanetParameters()
    }
    
    private func setupPlanetParameters(){
        areaLbl.text = planet.area
        tempLbl.text = planet.temperature
        massLbl.text = planet.mass
        
        
        let propsArray = [
            ("Area", areaLbl, areaLbl.text),
            ("Temperature", tempLbl, tempLbl.text),
            ("Mass", massLbl, massLbl.text),
        ]
        
        for prop in propsArray {
            configurePlanetParams(propName: prop.0, labelName: prop.1, labelText: prop.2 ?? "")
        }
    }
    
    private func configurePlanetParams(propName: String, labelName: UILabel, labelText: String) {
        let viewStack = UIStackView()
        infoStack.addArrangedSubview(viewStack)
        
        viewStack.axis = .horizontal
        viewStack.clipsToBounds = true
        viewStack.layer.borderWidth = 1
        viewStack.layer.borderColor = borderColor.cgColor
        viewStack.layer.cornerRadius = 15
        viewStack.layoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        viewStack.isLayoutMarginsRelativeArrangement = true
        
        let propertyName: UILabel = {
            let propertyName = UILabel()
            propertyName.text = propName
            propertyName.font = UIFont.systemFont(ofSize: 18)
            return propertyName
        }()
        viewStack.addArrangedSubview(propertyName)
        
        viewStack.addArrangedSubview(labelName)
        labelName.text = labelText
        labelName.textColor = primaryColor
        labelName.font = UIFont.systemFont(ofSize: 18)
        labelName.textAlignment = .center
        
        NSLayoutConstraint.activate([
            viewStack.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 20),
            viewStack.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor, constant: -20),
            viewStack.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}
