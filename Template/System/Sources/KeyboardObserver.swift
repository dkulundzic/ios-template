//
//  KeyboardObserver.swift
//  Template
//
//  Created by Domagoj Kulundzic on 03/10/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import UIKit

/// Defines methods to respond to keyboard appearance events. All methods have empty default implementations.
public protocol KeyboardObserverDelegate: class {
  func keyboardWillShow(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve)
  func keyboardWillHide(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve)
  func keyboardDidShow(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve)
  func keyboardDidHide(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve)
}

public extension KeyboardObserverDelegate {
  func keyboardWillShow(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve) { }
  func keyboardWillHide(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve) { }
  func keyboardDidShow(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve) { }
  func keyboardDidHide(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationCurve: UIView.AnimationCurve) { }
}

/// A convenience utility that eases responding to keyboard appearance events by
/// wrapping around the keyboard appearance notifications.
///
/// The supported appearance methods are defined by the **KeyboardObserverDelegate**.
public final class KeyboardObserver {
  /// The delegate to notify of keyboard appearance events.
  public weak var delegate: KeyboardObserverDelegate?
  
  /// Initialises a new instance.
  /// - parameter delegate: A **KeyboardObserverDelegate** conforming type. Defaults to **nil**.
  public init(delegate: KeyboardObserverDelegate? = nil) {
    self.delegate = delegate
    setupKeyboardObserving()
  }
  
  /// Since the **KeyboardObserver** will (in most cases) be defined as a **lazy var**, this method
  /// provides a sensical way of triggering the instance creation.
  public func observe() { }
}

private extension KeyboardObserver {
  func setupKeyboardObserving() {
    _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] in
      self?.processKeyboardNotification($0) { self?.delegate?.keyboardWillShow(keyboardHeight: $0, animationDuration: $1, animationCurve: $2) }
    }
    _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] in
      self?.processKeyboardNotification($0) { self?.delegate?.keyboardWillHide(keyboardHeight: $0, animationDuration: $1, animationCurve: $2) }
    }
    _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { [weak self] in
      self?.processKeyboardNotification($0) { self?.delegate?.keyboardDidShow(keyboardHeight: $0, animationDuration: $1, animationCurve: $2) }
    }
    _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: nil) { [weak self] in
      self?.processKeyboardNotification($0) { self?.delegate?.keyboardDidHide(keyboardHeight: $0, animationDuration: $1, animationCurve: $2) }
    }
  }
  
  func processKeyboardNotification(_ notification: Foundation.Notification, processingHandler: ((CGFloat, TimeInterval, UIView.AnimationCurve) -> Void)?) {
    guard
      let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height,
      let animationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
      let animationCurveRawValue = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.intValue,
      let animationCurve = UIView.AnimationCurve(rawValue: animationCurveRawValue) else {
        return
    }
    processingHandler?(keyboardHeight, animationDuration, animationCurve)
  }
}
