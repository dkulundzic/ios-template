//
//  AttributedStringBuilder.swift
//  Template
//
//  Created by Domagoj Kulundzic on 20/07/2018.
//  Copyright © 2018 Codeopolis. All rights reserved.
//

import UIKit

public class AttributedStringBuilder {
  enum BuilderError: Error {
    case invalidRange
  }

  public let text: String
  private var attributes = [NSAttributedString.Key: Any]()
  private var rangeAttributes = [(NSAttributedString.Key, Any, NSRange)]()

  public init(text: String) {
    self.text = text
  }
}

public extension AttributedStringBuilder {
  @discardableResult
  func addAttribute(key: NSAttributedString.Key, object: Any?) -> Self {
    if let object = object {
      attributes[key] = object
    }
    return self
  }

  @discardableResult
  func addAttribute(key: NSAttributedString.Key, object: Any?, range: NSRange) throws -> Self {
    try validate(range: range)
    if let object = object {
      rangeAttributes.append((key, object, range))
    }
    return self
  }

  @discardableResult
  func addAttribute(key: NSAttributedString.Key, object: Any?, inRangeOf fragment: String, searchBackwards: Bool = false) throws -> Self {
    let options: String.CompareOptions = searchBackwards ? [.backwards]: []
    guard let fragmentRange = text.range(of: fragment, options: options) else {
      throw BuilderError.invalidRange
    }
    let nsRange = NSRange(fragmentRange, in: text)
    return try addAttribute(key: key, object: object, range: nsRange)
  }

  @discardableResult
  func setFont(_ font: UIFont?) -> Self {
    return addAttribute(key: .font, object: font)
  }

  @discardableResult
  func setFont(_ font: UIFont?, range: NSRange) throws -> Self {
    return try addAttribute(key: .font, object: font, range: range)
  }

  @discardableResult
  func setFont(_ font: UIFont?, inRangeOf fragment: String, searchBackwards: Bool = false) throws -> Self {
    let options: String.CompareOptions = searchBackwards ? [.backwards]: []
    guard let fragmentRange = text.range(of: fragment, options: options) else {
      throw BuilderError.invalidRange
    }
    let nsRange = NSRange(fragmentRange, in: text)
    return try addAttribute(key: .font, object: font, range: nsRange)
  }

  func setFont(_ font: UIFont?, inRangesOf fragment: String) throws -> Self {
    try text
      .allRangesForOccurences(of: fragment)
      .forEach { range in
        try addAttribute(key: .font, object: font, range: NSRange(range, in: text))
      }
    return self
  }

  @discardableResult
  func setTextColor(_ color: UIColor?) -> Self {
    return addAttribute(key: .foregroundColor, object: color)
  }

  @discardableResult
  func setTextColor(_ color: UIColor?, inRangeOf fragment: String, searchBackwards: Bool = false) throws -> Self {
    let options: String.CompareOptions = searchBackwards ? [.backwards]: []
    guard let fragmentRange = text.range(of: fragment, options: options) else {
      throw BuilderError.invalidRange
    }
    let nsRange = NSRange(fragmentRange, in: text)
    return try addAttribute(key: .foregroundColor, object: color, range: nsRange)
  }

  func setTextColor(_ color: UIColor?, inRangesOf fragment: String) throws -> Self {
    try text
      .allRangesForOccurences(of: fragment)
      .forEach { range in
        try addAttribute(key: .foregroundColor, object: color, range: NSRange(range, in: text))
      }
    return self
  }

  @discardableResult
  func setTextColor(_ color: UIColor?, inRange range: NSRange) throws -> Self {
    return try addAttribute(key: .foregroundColor, object: color, range: range)
  }

  @discardableResult
  func setUnderlineStyle(_ style: NSUnderlineStyle) -> Self {
    return addAttribute(key: .underlineStyle, object: style.rawValue)
  }

  @discardableResult
  func setUnderlineStyle(_ style: NSUnderlineStyle, inRangeOf fragment: String, searchBackwards: Bool = false) throws -> Self {
    let options: String.CompareOptions = searchBackwards ? [.backwards]: []
    guard let fragmentRange = text.range(of: fragment, options: options) else {
      throw BuilderError.invalidRange
    }
    let nsRange = NSRange(fragmentRange, in: text)
    return try addAttribute(key: .underlineStyle, object: style.rawValue, range: nsRange)
  }

  func setUnderlineStyle(_ style: NSUnderlineStyle, inRangesOf fragment: String) throws -> Self {
    try text
      .allRangesForOccurences(of: fragment)
      .forEach { range in
        try addAttribute(key: .underlineStyle, object: style.rawValue, range: NSRange(range, in: text))
      }
    return self
  }

  @discardableResult
  func setLetterSpacing(_ spacing: Float) -> Self {
    return addAttribute(key: .kern, object: NSNumber(value: spacing))
  }

  @discardableResult
  func setStrikethroughStyle(_ style: NSUnderlineStyle) -> Self {
    return addAttribute(key: .strikethroughStyle, object: style.rawValue)
  }

  @discardableResult
  func setStrikethroughColor(_ color: UIColor) -> Self {
    return addAttribute(key: .strikethroughColor, object: color)
  }

  @discardableResult
  func setParagraphStyle(
    lineSpacing: CGFloat,
    heightMultiple: CGFloat = 1,
    lineHeight: CGFloat,
    lineBreakMode: NSLineBreakMode = .byWordWrapping,
    textAlignment: NSTextAlignment = .left
  ) -> Self {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineSpacing
    paragraphStyle.lineHeightMultiple = heightMultiple
    paragraphStyle.minimumLineHeight = lineHeight
    paragraphStyle.lineBreakMode = lineBreakMode
    paragraphStyle.alignment = textAlignment
    return addAttribute(key: .paragraphStyle, object: paragraphStyle)
  }

  func create() -> NSAttributedString {
    if rangeAttributes.isEmpty {
      return NSAttributedString(string: text, attributes: attributes)
    }
    return createMutable() as NSAttributedString
  }

  func createMutable() -> NSMutableAttributedString {
    let mutableString = NSMutableAttributedString(string: text, attributes: attributes)
    for (key, value, range) in rangeAttributes {
      mutableString.addAttribute(key, value: value, range: range)
    }
    return mutableString
  }
}

private extension AttributedStringBuilder {
  func validate(range: NSRange) throws {
    if text.count < range.location + range.length || range.location < 0 {
      throw BuilderError.invalidRange
    }
  }
}
