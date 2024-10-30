import UIKit

class FeedVC: UIViewController {
    let screenTitleLabel = UILabel()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        setupScreenTitle()
        setupTableView()
    }
    
    func setupScreenTitle() {
        view.addSubview(screenTitleLabel)
        
        screenTitleLabel.configureScreenTitle(text: "Latest News", size: 18)
        
        NSLayoutConstraint.activate([
            screenTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            screenTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 124
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: screenTitleLabel.bottomAnchor, constant: 11),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}


extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        return cell ?? UITableViewCell()
    }
}
