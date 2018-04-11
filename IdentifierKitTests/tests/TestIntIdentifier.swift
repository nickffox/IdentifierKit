//
//  TestIdentifier.swift
//  IdentifierKitTests
//
//  Created by Nick Fox on 4/7/18.
//  Copyright © 2018 Nick Fox Designs. All rights reserved.
//

import XCTest
@testable import IdentifierKit


class TestIntIdentifier: XCTestCase {
  let userJSONString = "{\"id\":1,\"name\":\"Leonardo\"}"
  lazy var userJSONData = { userJSONString.data(using: .utf8)! }()
}


// MARK: Test Codable
extension TestIntIdentifier {

  func testDecode() {
    do {
      let user = try JSONDecoder().decode(User.self, from: userJSONData)
      XCTAssert(user.name == "Leonardo")
      XCTAssert(user.id == UserId(1))
    } catch {
      XCTFail()
    }
  }

  func testEncode() {
    do {
      // Decode from JSON
      let user = try JSONDecoder().decode(User.self, from: userJSONData)
      // Re-encode this user
      let encodedUserData = try JSONEncoder().encode(user)
      // Create JSON String respresentation
      let encodedUserString = String(data: encodedUserData, encoding: .utf8)!
      // Verify that JSON out == JSON in
      XCTAssert(userJSONString == encodedUserString)
    } catch {
      XCTFail()
    }
  }
}


// MARK: Test Equatable
extension TestIntIdentifier {
  func testEquatable() {
    let userIdOne = UserId(1)
    let userIdTwo = UserId(2)
    let anotherUserIdOne = UserId(1)

    XCTAssert(userIdOne != userIdTwo)
    XCTAssert(userIdOne == anotherUserIdOne)
  }
}


// MARK: Test Hashable
extension TestIntIdentifier {
  func testHashable() {
    let userIdOne = UserId(1)
    let userIdTwo = UserId(2)
    let anotherUserIdOne = UserId(1)

    XCTAssert(userIdOne.hashValue != userIdTwo.hashValue)
    XCTAssert(userIdOne.hashValue == anotherUserIdOne.hashValue)
  }
}


// MARK: Test Comparable
extension TestIntIdentifier {
  func testComparable() {
    let userIdOne = UserId(1)
    let userIdTwo = UserId(2)
    let anotherUserIdOne = UserId(1)

    // Verify <
    XCTAssert(userIdOne < userIdTwo)
    // Verify <= when not equal
    XCTAssert(userIdOne <= userIdTwo)
    // Verify <= when equal
    XCTAssert(userIdOne <= anotherUserIdOne)
    // Verify >= when equal
    XCTAssert(userIdOne >= anotherUserIdOne)
    // Verify >= when not equal
    XCTAssert(userIdTwo >= userIdOne)
    // Verify > when equal
    XCTAssert(userIdTwo > userIdOne)
  }
}
