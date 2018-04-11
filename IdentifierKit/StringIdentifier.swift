//
//  StringIdentifier.swift
//  IdentifierKit
//
//  Created by Nick Fox on 4/7/18.
//  Copyright © 2018 Nick Fox Designs. All rights reserved.
//

import Foundation

/// Object used to wrap weakly typed String indentifer.
public struct StringIdentifier<T: Identifier> {
  /// Weakly typed ID that is being wrapped
  private let value: String

  public init(_ value: String) {
    self.value = value
  }
}


// MARK: Codable Conformance
extension StringIdentifier: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    value = try container.decode(String.self)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }
}


// MARK: CustomStringConvertible Conformance
extension StringIdentifier: CustomStringConvertible {
  public var description: String {
    return value
  }
}


// MARK: Equatable Conformance
extension StringIdentifier: Equatable {
  public static func ==(lhs: StringIdentifier, rhs: StringIdentifier) -> Bool {
    return lhs.value == rhs.value
  }
}


// MARK: Hashable Conformance
extension StringIdentifier: Hashable {
  public var hashValue: Int {
    return value.hashValue
  }
}


// MARK: Comparable Conformance
extension StringIdentifier: Comparable {
  public static func <(lhs: StringIdentifier, rhs: StringIdentifier) -> Bool {
    return lhs.value < rhs.value
  }
}
