//
//  UsersTestingAssignmentTests.swift
//  UsersTestingAssignmentTests
//
//  Created by Despo on 16.11.24.
//

import XCTest
@testable import UsersTestingAssignment

final class UsersTestingAssignmentTests: XCTestCase {
    var userViewModel: UserViewModel?
    var user: User?
    
    override func setUpWithError() throws {
        guard let jsonData = User.jsonMock.data(using: .utf8) else {
            XCTFail("JSON mock data is invalid")
            return
        }
        
        let userList = try JSONDecoder().decode(UserList.self, from: jsonData)
        
        print("🟢")
        
        userList.results.forEach { singleUser in
            user = singleUser
            userViewModel = UserViewModel(user: singleUser)
        }
    }
    
    override func tearDownWithError() throws {
        print("🔴")
        user = nil
        userViewModel = nil
    }
    
    func testFullName() throws {
        let user = try XCTUnwrap(user)
        
        XCTAssertEqual(userViewModel?.fullName, "\(user.name.title) \(user.name.first) \(user.name.last)")
    }
    
    func testPhoneNumber() throws {
        let user = try XCTUnwrap(user)
        
        XCTAssertEqual(userViewModel?.contactNumber, "\(user.cell) / \(user.phone)")
    }
    
    func testThumbnail() throws {
        let user = try XCTUnwrap(user)
        
        XCTAssertEqual(userViewModel?.thumbnailImageUrl, URL(string: user.picture.thumbnail))
    }
    
    func testUserEmail() throws {
        let user = try XCTUnwrap(user)
        
        XCTAssertEqual(userViewModel?.email, user.email)
    }
    
    func testPerformanceExample() throws {
        measure {
            guard let jsonData = User.jsonMock.data(using: .utf8) else { return }
            let userList = try? JSONDecoder().decode(UserList.self, from: jsonData)
            userList?.results.forEach { singleUser in
                user = singleUser
                userViewModel = UserViewModel(user: singleUser)
            }
        }
    }
}
