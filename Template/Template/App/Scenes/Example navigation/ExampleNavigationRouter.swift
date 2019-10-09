//
//  ExampleNavigationRouter.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import UIKit

protocol ExampleNavigationRoutingLogic: class {
  func unwindBack()
}

protocol ExampleNavigationRouterDelegate: class {
  func exampleNavigationRouterUnwindBack()
}

class ExampleNavigationRouter {
  weak var viewController: ExampleNavigationViewController?
  weak var delegate: ExampleNavigationRouterDelegate?
  
  static func createModule(delegate: ExampleNavigationRouterDelegate?) -> ExampleNavigationViewController {
    let view = ExampleNavigationViewController()
    let interactor = ExampleNavigationInteractor()
    let router = ExampleNavigationRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = ExampleNavigationPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    interactor.presenter = presenter
    return view
  }
}

// MARK: - ExampleNavigationRoutingLogic
extension ExampleNavigationRouter: ExampleNavigationRoutingLogic {
  func unwindBack() {
    print(#function)
    delegate?.exampleNavigationRouterUnwindBack()
  }
}
