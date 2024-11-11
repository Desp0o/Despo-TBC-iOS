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

final class ViewModel: NetworkServiceProtocol {
    weak var delegate: UpdateNewsDelegate?
    private var currentPage = 0
    
    init() {
        loadNextPage()
    }
    
    var newsArray: [SinglePost] = []
    
    var newsCount: Int {
        newsArray.count
    }
    
    func singlePost(index: Int) -> SinglePost {
        return newsArray[index]
    }
    
    static func fetchData<T>(urlString: String, completion: @escaping @Sendable (Result<T, NetworkManagerFramework.NetworkError>) -> Void) where T : Decodable, T : Encodable {
        NetworkService.fetchData(urlString: urlString, completion: completion)
    }
    
    func loadNextPage() {
        currentPage += 1
        
        let linkApi =  "https://newsapi.org/v2/everything?q=bitcoin&pageSize=30&page=\(currentPage)&apiKey=c20af04d5d98493e80e749a05098a930"
        
        NetworkService.fetchData(urlString: linkApi) { (result: Result<NewsResponseData, NetworkError>) in
            switch result {
            case .success(let posts):
                var finalData = posts.articles
                finalData.removeAll { post in
                    post.title == "[Removed]"
                }
                
                self.newsArray.append(contentsOf: finalData)
                self.delegate?.updateNewsFeed()
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
