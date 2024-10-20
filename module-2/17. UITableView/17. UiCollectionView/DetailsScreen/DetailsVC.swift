import UIKit

class DetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let navStack = UIStackView()
    private let detailImg = UIImageView()
    private let table = UITableView()
    private var screenTitle = UILabel()
    private let backButton = UIButton()
    private let favButton = UIButton()
    
    private let planet: Planet
    
    init(_ planet: Planet) {
        self.planet = planet
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor(hue: 18/360, saturation: 0.88, brightness: 0.13, alpha: 1)
        view.isUserInteractionEnabled = true
        setupNavigationBar()
        setupDetailsImage()
        setupDetailsTable()
    }

    private func setupNavigationBar() {
        view.addSubview(navStack)
        
        navStack.axis = .horizontal
        navStack.distribution = .equalSpacing
        navStack.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        navStack.isLayoutMarginsRelativeArrangement = true
        
        navStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            navStack.leftAnchor.constraint(equalTo: view.leftAnchor),
            navStack.rightAnchor.constraint(equalTo: view.rightAnchor),
            navStack.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        setupBackButton()
        setupDetailScreenTitle()
        setupFavIcon()
    }
    
    private func setupBackButton() {
        navStack.addArrangedSubview(backButton)
        
        backButton.setImage(UIImage(named: "backIcon"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.addAction(UIAction(handler: { action in
            self.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupFavIcon() {
        navStack.addArrangedSubview(favButton)
        
        favButton.configureButtonIcon(with: planet.isFaved ? "starActive" : "starInactive", size: 25)
        
        favButton.addAction(UIAction(handler: { action in
            print("test detail")
        }), for: .touchUpInside)
    }
    
    private func setupDetailScreenTitle() {
        navStack.addArrangedSubview(screenTitle)
        screenTitle.configureCustomLabel(with: planet.name, size: 36)

        NSLayoutConstraint.activate([
            screenTitle.centerXAnchor.constraint(equalTo: navStack.centerXAnchor),
            screenTitle.centerYAnchor.constraint(equalTo: navStack.centerYAnchor)
        ])
    }
    
    private func setupDetailsImage() {
        view.addSubview(detailImg)
        
        detailImg.image = planet.image
        detailImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailImg.topAnchor.constraint(equalTo: navStack.bottomAnchor, constant: 86),
            detailImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImg.widthAnchor.constraint(equalToConstant: 280),
            detailImg.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func setupDetailsTable() {
        view.addSubview(table)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
        table.separatorStyle = .none
        table.dataSource = self
        table.delegate = self
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: detailImg.bottomAnchor, constant: 112),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

extension DetailsVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planetInfoArray = [
            ("Area", planet.area),
            ("Temperature", planet.temp),
            ("Mass", planet.mass)
        ]
        let currentProperty = planetInfoArray[indexPath.row]

        
        let cell = table.dequeueReusableCell(withIdentifier: "DetailCell") as? DetailCell
        cell?.configureDetailCell(propName: currentProperty.0, propValue: currentProperty.1)
        
        return cell ?? UITableViewCell()
    }
}
