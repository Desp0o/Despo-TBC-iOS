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
        
        guard let userMock = userList.results.first else {
            XCTFail("No user")
            return
        }
        
        print("🟢")
        user = try XCTUnwrap(userMock)
        userViewModel = UserViewModel(user: userMock)
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
}
