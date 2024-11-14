//
//  ViewModel.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//
import Foundation
import NetworkManagerFramework
import DateFormatterFramework

protocol UpdateNewsDelegate: AnyObject {
    func updateNewsFeed()
}

final class ViewModel {
    weak var delegate: UpdateNewsDelegate?
    private let dateFormatter: DateFormatProtocol
    private let networkService: NetworkServiceProtocol
    private var currentPage = 0
    
    init(dateFormatter: DateFormatProtocol = DateFormat(), networkService: NetworkServiceProtocol = NetworkService()) {
        self.dateFormatter = dateFormatter
        self.networkService = networkService
        loadNextPage()
    }
    
    var newsArray: [SinglePost] = []
    
    var newsCount: Int {
        newsArray.count
    }
    
    func singlePost(index: Int) -> SinglePost {
        return newsArray[index]
    }
    
    func loadNextPage() {
        currentPage += 1
        let linkApi = "https://newsapi.org/v2/everything?q=bitcoin&pageSize=30&page=\(currentPage)&apiKey=c20af04d5d98493e80e749a05098a930"
        
        networkService.fetchData(urlString: linkApi) { (result: Result<NewsResponseData, NetworkError>) in
            switch result {
            case .success(let posts):
                var finalData = posts.articles
                
                finalData.removeAll { post in
                    post.title == "[Removed]"
                }
                
                finalData = finalData.map {[weak self] post in
                    var updatedPost = post
                    updatedPost.publishedAt = self?.dateFormatter.formatDate(date: post.publishedAt) ?? post.publishedAt
                    return updatedPost
                }
                
                self.newsArray.append(contentsOf: finalData)
                self.delegate?.updateNewsFeed()
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
