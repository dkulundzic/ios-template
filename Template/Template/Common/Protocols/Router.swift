//
//  Router.swift
//  Template
//
//  Created by Domagoj Kulundzic on 27/05/2019.
//  Copyright © 2019 Martian & Machine. All rights reserved.
//

import UIKit

public protocol Router: class {
  associatedtype RouterDelegate
  var delegate: RouterDelegate? { get set }
  static func createModule(delegate: RouterDelegate?) -> UIViewController
}
