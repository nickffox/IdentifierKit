//
//  TestStringIdentifier.swift
//  IdentifierKitTests
//
//  Created by Nick Fox on 4/7/18.
//  Copyright © 2018 Nick Fox Designs. All rights reserved.
//

import XCTest
@testable import IdentifierKit


class TestStringIdentifier: XCTestCase {
  let carJSONString = "{\"make\":\"DeLorean\",\"licensePlate\":\"OUTATIME\"}"
  lazy var carJSONData = { carJSONString.data(using: .utf8)! }()
}


// MARK: Test Codable
extension TestStringIdentifier {

  func testDecode() {
    do {
      let car = try JSONDecoder().decode(Car.self, from: carJSONData)
      XCTAssert(car.make == "DeLorean")
      XCTAssert(car.licensePlate == LicensePlate("OUTATIME"))
    } catch {
      XCTFail()
    }
  }

  func testEncode() {
    do {
      // Decode from JSON
      let car = try JSONDecoder().decode(Car.self, from: carJSONData)
      // Re-encode this user
      let encodedCarData = try JSONEncoder().encode(car)
      // Create JSON String respresentation
      let encodedCarString = String(data: encodedCarData, encoding: .utf8)!
      // Verify that JSON out == JSON in
      XCTAssert(carJSONString == encodedCarString)
    } catch {
      XCTFail()
    }
  }
}


// MARK: Test Equatable
extension TestStringIdentifier {
  func testEquatable() {
    let plateOne = LicensePlate("ECTO-1")
    let plateTwo = LicensePlate("OUTATIME")
    let anotherPlateOne = LicensePlate("ECTO-1")

    XCTAssert(plateOne != plateTwo)
    XCTAssert(plateOne == anotherPlateOne)
  }
}


// MARK: Test Hashable
extension TestStringIdentifier {
  func testHashable() {
    let plateOne = LicensePlate("ECTO-1")
    let plateTwo = LicensePlate("OUTATIME")
    let anotherPlateOne = LicensePlate("ECTO-1")

    XCTAssert(plateOne.hashValue != plateTwo.hashValue)
    XCTAssert(plateOne.hashValue == anotherPlateOne.hashValue)
  }
}


// MARK: Test Comparable
extension TestStringIdentifier {
  func testComparable() {
    let plateOne = LicensePlate("ECTO-1")
    let plateTwo = LicensePlate("OUTATIME")
    let anotherPlateOne = LicensePlate("ECTO-1")

    // Verify <
    XCTAssert(plateOne < plateTwo)
    // Verify <= when not equal
    XCTAssert(plateOne <= plateTwo)
    // Verify <= when equal
    XCTAssert(plateOne <= anotherPlateOne)
    // Verify >= when equal
    XCTAssert(plateOne >= anotherPlateOne)
    // Verify >= when not equal
    XCTAssert(plateTwo >= plateOne)
    // Verify > when equal
    XCTAssert(plateTwo > plateOne)
  }
}
