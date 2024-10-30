//
//  ViewModel.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//
import Foundation

protocol UpdateNewsDelegate: AnyObject {
    func updateNewsFeed()
}

final class ViewModel {
    weak var delegate: UpdateNewsDelegate?
    private var currentPage = 0
    private var isFetching = false
    
    init() {
        loadNextPage()
    }
    
    var newsArray: [SinglePost] = []
    
    var newsCount: Int {
        newsArray.count
    }
    
    func singlePost(index: Int) -> SinglePost {
        
        if newsArray[index].title == "[Removed]" {
            newsArray.remove(at: index)
        }
        
        return newsArray[index]
    }
    
    func fetchNews(page: Int) {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&pageSize=10&page=\(page)&apiKey=9670879ea1df4f23b16aa2e834f82a66"
        let url = URL(string: urlString)
        
        guard let url = url else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) {[weak self] data, response, error in
            let decoder = JSONDecoder()
            
            if let error {
                print(error)
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            guard (200...299).contains(response.statusCode) else { return }
            guard let data else { return }
            
            do {
                let newsResponseData = try decoder.decode(NewsResponseData.self, from: data)
                self?.newsArray.append(contentsOf: newsResponseData.articles)
                DispatchQueue.main.async {
                    self?.delegate?.updateNewsFeed()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    func loadNextPage() {
        currentPage += 1
        fetchNews(page: currentPage)
    }
}
