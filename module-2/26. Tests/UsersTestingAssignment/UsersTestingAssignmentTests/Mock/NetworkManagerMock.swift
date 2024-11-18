//
//  File.swift
//  UsersTestingAssignmentTests
//
//  Created by Despo on 18.11.24.
//

import Foundation
//
//  NetworkManagerMock.swift
//  UsersTestingAssignment
//
//  Created by Despo on 18.11.24.
//

import UIKit
@testable import UsersTestingAssignment

final class MockNetworkManager {

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
