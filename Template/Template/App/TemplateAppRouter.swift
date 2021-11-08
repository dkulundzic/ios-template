//
//  TemplateAppRouter.swift
//  Template
//
//  Created by Domagoj Kulundzic on 08.11.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit

final class TemplateAppRouter { }

extension TemplateAppRouter {
  func initialViewController() -> UIViewController {
    ExampleNavigationRouter.createModule(delegate: self)
  }
}

// MARK: ExampleNavigationRouterDelegate
extension TemplateAppRouter: ExampleNavigationRouterDelegate {
  func exampleNavigationRouterUnwindBack() { }
}
