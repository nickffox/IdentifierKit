//
//  User.swift
//  IdentifierKitTests
//
//  Created by Nick Fox on 4/7/18.
//  Copyright © 2018 Nick Fox Designs. All rights reserved.
//

import Foundation
import IdentifierKit


struct User: Codable {
  let id: UserId
  let name: String
}
