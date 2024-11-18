//
//  NetworkManagerTests.swift
//  UsersTestingAssignmentTests
//
//  Created by Despo on 17.11.24.
//

import XCTest
@testable import UsersTestingAssignment

class MockNetworkManager {
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


final class NetworkManagerTests: XCTestCase {
    var networkManager: MockNetworkManager?
    
    override func setUpWithError() throws {
        super.setUp()
        
        print("🟢")
        networkManager = MockNetworkManager()
    }
    
    override func tearDownWithError() throws {
        print("🔴")
        networkManager = nil
    }
    
    func testFetchUsersWithLimit() {
        let expectedCount = 2
        
        networkManager?.fetchUsers(withLimit: expectedCount) { users in
            XCTAssertEqual(users.count, expectedCount)
        }
    }
    
    func testFetchUsersExceedingMockLimit() {
        let limit = 3
        
        networkManager?.fetchUsers(withLimit: limit) { users in
            XCTAssertEqual(users.count, self.networkManager?.mockUsers.count)
        }
    }
    
    func testFetchUsersWithZeroLimit() {
        networkManager?.fetchUsers(withLimit: 0) { users in
            XCTAssertTrue(users.isEmpty)
        }
    }
    
    func testFetchUsersWithEmptyMockUsers() {
        networkManager?.mockUsers = []
        
        networkManager?.fetchUsers(withLimit: 1) { users in
            XCTAssertTrue(users.isEmpty)
        }
    }
}

