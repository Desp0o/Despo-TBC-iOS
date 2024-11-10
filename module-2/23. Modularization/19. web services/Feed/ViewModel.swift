//
//  ViewModel.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//
import Foundation
import NetworkManagerFramework

protocol UpdateNewsDelegate: AnyObject {
    func updateNewsFeed()
}

final class ViewModel {
    private let networkService: NetworkServiceProtocol
    weak var delegate: UpdateNewsDelegate?
    private var currentPage = 0
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        loadNextPage()
    }
    
    var newsArray: [SinglePost] = []
    
    var newsCount: Int {
        newsArray.count
    }
    
    func singlePost(index: Int) -> SinglePost {
        if index < newsArray.count && newsArray[index].title == "[Removed]" {
            newsArray.remove(at: index)
            print("remove")
        }
            
        return newsArray[index]
    }
    
    func loadNextPage() {
        currentPage += 1
        
        let linkApi =  "https://newsapi.org/v2/everything?q=bitcoin&pageSize=30&page=\(currentPage)&apiKey=815bdd179bed438aa183f4d2a6ff264f"
        
        networkService.fetchData(urlString: linkApi) { [weak self] (result: Result<NewsResponseData, NetworkError>) in
            switch result {
            case .success(let posts):
                self?.newsArray.append(contentsOf: posts.articles)
                self?.delegate?.updateNewsFeed()
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
