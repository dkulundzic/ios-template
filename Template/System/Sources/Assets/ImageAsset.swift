//
//  ImageAsset.swift
//  System
//
//  Created by Domagoj Kulundzic on 13/08/2019.
//

import Foundation

public protocol ImageAsset: Asset {
  var image: UIImage { get }
}

public extension ImageAsset {
  var image: UIImage {
    guard let image = UIImage(named: name) else {
      fatalError("Can't find the \(name) image asset.")
    }
    return image
  }
  
  var imageTemplate: UIImage {
    return image.withRenderingMode(.alwaysTemplate)
  }
  
  var imageOriginal: UIImage {
    return image.withRenderingMode(.alwaysOriginal)
  }
}

public extension ImageAsset where Self: RawRepresentable, Self.RawValue == String {
  var name: String {
    return rawValue
  }
}
