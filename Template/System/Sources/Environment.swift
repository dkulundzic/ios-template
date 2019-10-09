//
//  Environment.swift
//  Template
//
//  Created by Domagoj Kulundzic on 07/08/2019.
//

import Foundation

public enum Environment: String {
  case debug
  case staging
  case release
}

public extension Environment {
  static var current: Environment {
    #if DEBUG
    return .debug
    #elseif STAGING
    return .staging
    #elseif RELEASE
    return .release
    #endif
  }
  
  static var isDebug: Bool {
    return current == .debug
  }
  
  static var isStaging: Bool {
    return current == .staging
  }
  
  static var isProduction: Bool {
    return current == .release
  }
}
