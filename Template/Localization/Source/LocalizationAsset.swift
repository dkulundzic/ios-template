//
//  LocalizationAsset.swift
//  Localization
//
//  Created by Domagoj Kulundzic on 05/10/2019.
//

import Foundation
import System

public protocol LocalizationAsset: Asset {
  func localized(_ args: CVarArg...) -> String
}

public extension LocalizationAsset {
  func localized(_ args: CVarArg...) -> String {
    guard !name.isEmpty else { return name }
    let localizedString = NSLocalizedString(name, comment: "")
    return withVaList(args) { NSString(format: localizedString, locale: Locale.current, arguments: $0) as String }
  }
}
