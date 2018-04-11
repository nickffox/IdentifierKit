//
//  Identifier.swift
//  IdentifierKit
//
//  Created by Nick Fox on 4/7/18.
//  Copyright © 2018 Nick Fox Designs. All rights reserved.
//

import Foundation

/// Object used to wrap weakly typed Int indentifer.
public struct IntIdentifier<T: Identifier> {
  /// Weakly typed ID that is being wrapped
  private let value: Int

  public init(_ value: Int) {
    self.value = value
  }
}


// MARK: Codable Conformance
extension IntIdentifier: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    value = try container.decode(Int.self)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }
}


// MARK: CustomStringConvertible Conformance
extension IntIdentifier: CustomStringConvertible {
  public var description: String {
    return "\(value)"
  }
}


// MARK: Equatable Conformance
extension IntIdentifier: Equatable {
  public static func ==(lhs: IntIdentifier, rhs: IntIdentifier) -> Bool {
    return lhs.value == rhs.value
  }
}


// MARK: Hashable Conformance
extension IntIdentifier: Hashable {
  public var hashValue: Int {
    return value.hashValue
  }
}


// MARK: Comparable Conformance
extension IntIdentifier: Comparable {
  public static func <(lhs: IntIdentifier, rhs: IntIdentifier) -> Bool {
    return lhs.value < rhs.value
  }
}
