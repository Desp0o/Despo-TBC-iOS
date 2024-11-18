//
//  NetworkManager.swift
//  UsersTesting
//
//  Created by Nino Godziashvili on 15.11.24.
//

import UIKit

protocol NetworkService {
    func fetchUsers(withLimit limit: Int, completionHandler: @escaping ([User]) -> Void)
}

final class NetworkManager: NSObject, NetworkService {
    static let sharedInstance = NetworkManager()
    
    var users: [User] = []
    private let baseUrl = "https://randomuser.me/api/"
    
    private override init() {
        super.init()
    }
    
    func fetchUsers(withLimit limit: Int = 1, completionHandler: @escaping ([User]) -> Void) {
        guard let url = URL(string: baseUrl + "?results=\(limit)") else {
            print("Invalid URL")
            return
        }
        
        print("Fetching data for URL: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching users: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data {
                do {
                    let userList = try JSONDecoder().decode(UserList.self, from: data)
                    completionHandler(userList.results)
                } catch {
                    print("Failed to decode data: \(error)")
                }
            }
        }
        task.resume()
    }
}

class MockNetworkManager: NetworkService {
    
    var mockUsers: [User] = {
        guard let jsonData = User.jsonMock.data(using: .utf8) else {
            return []
        }
        
        do {
            let userList = try JSONDecoder().decode(UserList.self, from: jsonData)
            return userList.results
        } catch {
            print("Failed to decode JSON: \(error)")
            return []
        }
    }()
    
    func fetchUsers(withLimit limit: Int, completionHandler: @escaping ([User]) -> Void) {
        let limitedUsers = Array(mockUsers.prefix(limit))
        completionHandler(limitedUsers)
    }
}


