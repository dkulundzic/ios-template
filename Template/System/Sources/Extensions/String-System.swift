//
//  String-System.swift
//  System
//
//  Created by Domagoj Kulundzic on 08.11.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == String {
  var isEmptyOrNil: Bool {
    switch self {
    case .none:
      return true
    case .some(let text):
      return text.isEmpty
    }
  }
}

public extension String {
  func capitalizingFirstLetter() -> String {
    prefix(1).capitalized + dropFirst()
  }

  mutating func capitalizeFirstLetter() {
    self = self.capitalizingFirstLetter()
  }

  func allRangesForOccurences(of string: String) -> [Range<String.Index>] {
    var ranges: [Range<String.Index>] = []
    while let range = self.range(of: string, options: [], range: (ranges.last?.upperBound ?? self.startIndex)..<self.endIndex, locale: Locale.current) {
      ranges.append(range)
    }
    return ranges
  }
}
