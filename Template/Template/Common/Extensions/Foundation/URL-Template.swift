//
//  URL-Template.swift
//  Template
//
//  Created by Domagoj Kulundzic on 02/10/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

public extension URL {
	init?(string: String?) {
		guard let urlString = string else {
			return nil
		}
		self.init(string: urlString)
	}
  
  init(unicodeScalarLiteral value: StaticString) {
    self.init(stringLiteral: value)
  }
  
  init(extendedGraphemeClusterLiteral value: StaticString) {
    self.init(stringLiteral: value)
  }
}

extension URL: ExpressibleByStringLiteral {
	public init(stringLiteral value: StaticString) {
		guard let url = URL(string: "\(value)") else { fatalError("\"\(value)\" is not convertable into a URL instance.") }
		self = url
	}
}
