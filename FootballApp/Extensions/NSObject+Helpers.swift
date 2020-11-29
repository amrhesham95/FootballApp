//
//  NSObject+Helpers.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/30/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

/// NSObject: Helper Methods
///
extension NSObject {
  
  /// Returns the receiver's classname as a string, not including the namespace.
  ///
  class var classNameWithoutNamespaces: String {
    return String(describing: self)
  }
}
