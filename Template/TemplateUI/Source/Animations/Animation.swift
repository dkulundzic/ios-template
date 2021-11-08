//
//  Animation.swift
//  TemplateUI
//
//  Created by Domagoj Kulundzic on 09.03.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit

public struct Animation {
  public typealias Animations = () -> Void
  public typealias Completion = (Bool) -> Void

  public struct Parameters {
    public static let defaultDuration: TimeInterval = 0.3
    public static let defaultSpringDamping: CGFloat = 0.75
  }
}

public extension Animation {
  static func animation(
    duration: TimeInterval = Parameters.defaultDuration,
    delay: TimeInterval = 0.0,
    options: UIView.AnimationOptions = [],
    animations: @escaping Animations,
    completion: Completion? = nil
  ) {
    UIView.animate(
      withDuration: duration,
      delay: delay,
      options: options,
      animations: animations,
      completion: completion
    )
  }

  static func spring(
    duration: TimeInterval = Parameters.defaultDuration,
    delay: TimeInterval = 0.0,
    damping: CGFloat = Parameters.defaultSpringDamping,
    velocity: CGFloat = 0.0,
    animations: @escaping Animations,
    completion: Completion? = nil
  ) {
    UIView.animate(
      withDuration: duration,
      delay: delay,
      usingSpringWithDamping: damping,
      initialSpringVelocity: velocity,
      options: [],
      animations: animations,
      completion: completion
    )
  }

  static func transition(
    with view: UIView,
    duration: TimeInterval = Parameters.defaultDuration,
    animated: Bool = true,
    options: UIView.AnimationOptions = [.transitionCrossDissolve],
    animations: @escaping Animations,
    completion: Completion? = nil
  ) {
    UIView.transition(
      with: view,
      duration: animated ? duration : 0.0,
      options: options,
      animations: animations,
      completion: completion
    )
  }
}
