//
//  ExampleRouter.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//  Copyright © 2019 Martian & Machine. All rights reserved.
//

import UIKit

protocol ExampleRoutingLogic: class {
  func navigateToExampleNavigation()
  func unwindBack()
}

protocol ExampleRouterDelegate: class {
  func exampleRouterRequestedUnwind()
}

class ExampleRouter: Router {
  weak var viewController: UIViewController?
  weak var delegate: ExampleRouterDelegate?
  
  static func createModule(delegate: ExampleRouterDelegate?) -> UIViewController {
    let view = ExampleViewController()
    let interactor = ExampleInteractor()
    let router = ExampleRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = ExamplePresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    interactor.presenter = presenter
    return UINavigationController(rootViewController: view)
  }
}

// MARK: - ExampleRoutingLogic
extension ExampleRouter: ExampleRoutingLogic {
  func navigateToExampleNavigation() {
    print(#function)
    let exampleNavigationScene = ExampleNavigationRouter.createModule(delegate: self)
    viewController?.navigationController?.pushViewController(exampleNavigationScene, animated: true)
  }
  
  func unwindBack() {
    print(#function)
    delegate?.exampleRouterRequestedUnwind()
  }
}

extension ExampleRouter: ExampleNavigationRouterDelegate {
  func exampleNavigationRouterUnwindBack() {
    print(#function)
    viewController?.navigationController?.popViewController(animated: true)
  }
}