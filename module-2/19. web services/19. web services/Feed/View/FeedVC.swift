import UIKit

final class FeedVC: UIViewController, UpdateNewsDelegate {
    let viewModelPost = ViewModel()
    let screenTitleLabel = UILabel()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
    
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelPost.delegate = self
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
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 124
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: screenTitleLabel.bottomAnchor, constant: 11),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func updateNewsFeed() {
        tableView.reloadData()
    }
}


extension FeedVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelPost.newsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell
        let currentNews = viewModelPost.singlePost(index: indexPath.row)
        cell?.configureCell(news: currentNews)
        
        if indexPath.row == viewModelPost.newsCount - 1 {
            viewModelPost.loadNextPage()
        }
        print(currentNews)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentNews = viewModelPost.singlePost(index: indexPath.row)
        let vc = DetailsVC(news: currentNews)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
