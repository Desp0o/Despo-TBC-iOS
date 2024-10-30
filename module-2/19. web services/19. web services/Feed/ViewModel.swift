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
    
    init() {
        fetchNews()
    }
    
    var newsArray: [SinglePost] = [SinglePost(
        source: Source(id: "wired", name: "Wired"),
        author: "Joel Khalili",
        title: "Unmasking Bitcoin Creator Satoshi Nakamoto—Again",
        description: "A new HBO documentary takes a swing at uncovering the real identity of Satoshi Nakamoto, inventor of Bitcoin. But without incontrovertible proof, the myth lives on.",
        url: "https://www.wired.com/story/unmasking-bitcoin-creator-satoshi-nakamoto-again/",
        urlToImage: "https://media.wired.com/photos/6703eb3979f13fda7f04485b/191:100/w_1280,c_limit/Satoshi-Nakamoto-biz-1341874258.jpg",
        publishedAt: "2024-10-09T01:00:00Z", content: ""
    )]

    var newsCount: Int {
        newsArray.count
    }
    
    func singlePost(index: Int) -> SinglePost {
        newsArray[index]
    }
    
    func fetchNews() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=9670879ea1df4f23b16aa2e834f82a66"
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
}
