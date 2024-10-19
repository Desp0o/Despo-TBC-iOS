//
//  ViewController.swift
//  17. UiCollectionView
//
//  Created by Despo on 19.10.24.
//

import UIKit

class SolarVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private let collectionView: UICollectionView = {
        let collection: UICollectionView
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.itemSize = CGSize(width: 168, height: 180)
        collectionLayout.minimumLineSpacing = 38
        
        
        collection = UICollectionView(frame: CGRect(x: 20, y: 20, width: 100, height: 100), collectionViewLayout: collectionLayout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    private var screenTitleLbl = UILabel()
    
    var planetsArray = [
        (image: UIImage(named: "mercury"), name: "Mercury", area: "1,258,250 km²", temperature: "-60°C", mass: "460.234.317", isFaved: false),
        (image: UIImage(named: "venus"), name: "Venus", area: "4,602,000 km²", temperature: "462°C", mass: "4.867×10^24 kg", isFaved: true),
        (image: UIImage(named: "earth"), name: "Earth", area: "510,100,000 km²", temperature: "15°C", mass: "5.972×10^24 kg", isFaved: false),
        (image: UIImage(named: "mars"), name: "Mars", area: "144,800,000 km²", temperature: "-63°C", mass: "641.71×10^21 kg", isFaved: false),
        (image: UIImage(named: "jupiter"), name: "Jupiter", area: "61,418,738,571 km²", temperature: "-145°C", mass: "1.898×10^27 kg", isFaved: true),
        (image: UIImage(named: "saturn"), name: "Saturn", area: "42,700,000,000 km²", temperature: "-178°C", mass: "5.683×10^26 kg", isFaved: false),
        (image: UIImage(named: "uranus"), name: "Uranus", area: "8,115,600,000 km²", temperature: "-224°C", mass: "8.681×10^25 kg", isFaved: false),
        (image: UIImage(named: "neptune"), name: "Neptune", area: "7,618,300,000 km²", temperature: "-214°C", mass: "1.024×10^26 kg", isFaved: true),
        (image: UIImage(named: "pluto"), name: "Pluto", area: "16,647,940 km²", temperature: "-229°C", mass: "1.303×10^22 kg", isFaved: false),
        (image: UIImage(named: "eris"), name: "Eris", area: "6,440,000 km²", temperature: "-243°C", mass: "1.66×10^22 kg", isFaved: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(collectionView)
        
        view.backgroundColor = UIColor(hue: 18/360, saturation: 0.88, brightness: 0.13, alpha: 1)
        
       
        setupScreenTitle()
        setupCollectionView()
    }
    
    private func setupScreenTitle() {
        view.addSubview(screenTitleLbl)
        screenTitleLbl.text = "Planets"
        screenTitleLbl.screenTitle()
        
        NSLayoutConstraint.activate([
            screenTitleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            screenTitleLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        
        collectionView.register(PlanetCell.self, forCellWithReuseIdentifier: "PlanetCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: screenTitleLbl.bottomAnchor, constant: 56),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

extension SolarVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planetsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCell
        cell?.isUserInteractionEnabled = true
        
        let currentPlanet = planetsArray[indexPath.row]
        
        cell?.configurePlanetCell(planetImg: currentPlanet.image ?? UIImage(), titleLbl: currentPlanet.name, areaLbl: currentPlanet.area, isFaved: currentPlanet.isFaved)
        
        return cell ?? PlanetCell()
    }
}

extension SolarVC {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentPlanet = planetsArray[indexPath.row]
        
        let planet = Planet(image: currentPlanet.image ?? UIImage(), name: currentPlanet.name, area: currentPlanet.name, temp: currentPlanet.temperature, mass: currentPlanet.mass, isFaved: currentPlanet.isFaved)
        
        navigationController?.pushViewController(DetailsVC(planet), animated: true)
    }
}




#Preview {
    let vc = SolarVC()
    return vc
}
