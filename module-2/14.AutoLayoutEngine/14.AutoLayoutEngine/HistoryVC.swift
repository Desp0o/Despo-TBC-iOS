import UIKit

class HistoryVC: UIViewController {
    private let backButton = UIButton()
    private let mainView = UIStackView()
    
    var isDarkMode: Bool
    var operationsArray: [String]

    init(isDarkMode: Bool, operationsArray: [String]) {
        self.isDarkMode = isDarkMode
        self.operationsArray = operationsArray
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
        view.backgroundColor = isDarkMode ? darkThemeBackgroundColor : lightThemeBackgroundColor
        setupScreen()
        setupHistoryLabels()
        setupBackButton()
    }
    
    private func setupBackButton() {
        view.addSubview(backButton)
        view.bringSubviewToFront(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: isDarkMode ? "backArrowLight" : "backArrowDark"), for: .normal)
                
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        ])
        
        backButton.addAction(UIAction(handler: {[weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupScreen() {
        view.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.axis = .vertical
        mainView.distribution = .fill
        mainView.spacing = 16
        mainView.alignment = .trailing
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        ])
    }

    private func setupHistoryLabels() {
        for label in operationsArray {
            let lbl = UILabel()
            lbl.text = label
            lbl.textColor = isDarkMode ? .white : .black
            lbl.font = UIFont.systemFont(ofSize: 20)
            
            mainView.addArrangedSubview(lbl)
            
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -29).isActive = true
        }
    }
}
