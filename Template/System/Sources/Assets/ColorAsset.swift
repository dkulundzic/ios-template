//
//  ColorAsset.swift
//  System
//
//  Created by Domagoj Kulundzic on 13/08/2019.
//

import Foundation

public protocol ColorAsset: Asset {
  var color: UIColor { get }
}

public extension ColorAsset {
  var color: UIColor {
    guard let color = UIColor(named: name) else {
      fatalError("Can't find the \(name) image asset.")
    }
    return color
  }
}

public extension ColorAsset where Self: RawRepresentable, Self.RawValue == String {
  var name: String {
    return rawValue
  }
}
